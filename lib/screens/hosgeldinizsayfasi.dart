import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'screens.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Image(
                        image: AssetImage('assets/images/logo3.png'),
                      ),
                    ),
                  ),
                  const Text(
                    'Hoşgeldiniz.',
                    style: kHeadline,
                    textScaleFactor: 1.0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Text(
                      'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
                      style: kBodyText,
                      textAlign: TextAlign.center,
                    ),
                  )
                ]),
              ),
              Container(
                height: 140,
                decoration: BoxDecoration(
                  // color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const GirisYap(),
                                ));
                          },
                          child: const Text(
                            'Giriş Yap',
                            style: kButtonText,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const Kayitol(),
                                ));
                          },
                          child: const Text(
                            'Kayıt Ol',
                            style: kButtonText,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
