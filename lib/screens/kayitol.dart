// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application_1/screens/girisyap.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';

class Kayitol extends StatefulWidget {
  const Kayitol({Key? key}) : super(key: key);

  @override
  State<Kayitol> createState() => _KayitolState();
}

class _KayitolState extends State<Kayitol> {
  late String name;

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Image(
            width: 25,
            height: 25,
            color: Colors.white,
            image: AssetImage('assets/images/back.png'),
          ),
        ),
// backgroundColor: Colors.transparent,
        backgroundColor: const Color(0xff191720),
        elevation: 0,
        title: const Text("Çıkış"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Flexible(
                    child: Column(children: [
                      SizedBox(
                        height: 1,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText(
                            'Kayıt ol',
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'OuterSans'),
                          )
                        ],
                        repeatForever: true,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          '',
                          style: kBodyText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      yazialanim(
                        hintText: 'Kullanıcı Adınızı Giriniz',
                        inputType: TextInputType.text,
                        isPassword: false,
                        isPrivete: false,
                       inputAction: TextInputAction.next,
                      ),
                      yazialanim(
                        hintText: 'Şifrenizi Giriniz',
                        inputType: TextInputType.text,
                        isPassword: true,
                        isPrivete: true,
                         inputAction: TextInputAction.next,
                        myValidator: (value) {
                          
                          if (value!.length < 5) {
                            TextStyle(
                                fontFamily: 'OuterSans', color: Colors.grey);
                            return 'Bu alan 5 den büyük olmalı';
                          } else {
                            return null;
                          }
                        },
                      ),
                      yazialanim(
                        hintText: 'Şifrenizi Giriniz (Yeniden)',
                        inputType: TextInputType.text,
                        isPassword: true,
                        isPrivete: true,
                       inputAction: TextInputAction.next,
                      ),
                      yazialanim(
                        hintText: 'İsiminizi Giriniz',
                        inputType: TextInputType.text,
                        isPassword: false,
                        isPrivete: false,
                      ),
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
                          child: Container(),
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
                                      builder: (context) => const HomeScreen(),
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
        ),
      ),
    );
  }
}
