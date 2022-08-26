import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application_1/screens/girisyap.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import '../screens/HomeScreen.dart';




class isimDegis extends StatefulWidget {
  const isimDegis({Key? key}) : super(key: key);

  @override
  State<isimDegis> createState() => _isimDegisState();
}

class _isimDegisState extends State<isimDegis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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

//        backgroundColor: Colors.transparent,
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
                      Text(
                            'Şifreni Değiştir',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'OuterSans'),
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
                     SizedBox(height: 130),
                     Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    
                                    ));
                              },
                              
                              child: const Text('Kaydet',style: kButtonText,),
                            ),
                  ),
                ),
                
              ),
                    SizedBox(height: 20),
                    Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    
                                    ));
                              },
                              
                              child: const Text('Bitti',style: kButtonText,),
                            ),
                 
                  ),
                ),
              ),
                    SizedBox(height: 40)
                    ]),
                  ),
      ]),
      ),
      ),
      ),
      ),
      );
    
  }
}


