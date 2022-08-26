import 'package:flutter_application_1/models/loginModel.dart';
import 'package:flutter_application_1/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import '../widget/buton.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class GirisYap extends StatefulWidget {
  const GirisYap({Key? key}) : super(key: key);

  @override
  State<GirisYap> createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  late String name;

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  MyLoginModel model = MyLoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,CupertinoPageRoute(builder: (context) => const WelcomPage()
            ));
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Hoşgeldiniz',
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
                const Text(
                  'Uzun Zaman Oldu!',
                  style: kBodyText2,
                ),
                const SizedBox(
                  height: 60,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      yazialanim(
                        hintText: 'Mail Adresinizi Giriniz',
                        inputType: TextInputType.emailAddress,
                        isPassword: false,
                        isPrivete: false,
                        inputAction: TextInputAction.next,
                        myonSaved: (value) {
                          model.email = value!;
                        },
                      ),
                      yazialanim(
                        hintText: 'Şifrenizi Giriniz',
                        inputType: TextInputType.emailAddress,
                        isPassword: true,
                        isPrivete: true,
                        myonSaved: (value) {
                          model.password = value!;
                        },
                      ),
                    ],
                  ),
                ),
                buton(
                  myKey: _formkey,
                  model: model,
                )
                // ElevatedButton(
                //   onPressed: () {
                //     // Validate returns true if the form is valid, or false otherwise.
                //     if (_formkey.currentState!.validate()) {
                //       // If the form is valid, display a snackbar. In the real world,
                //       // you'd often call a server or save the information in a database.
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(content: Text('Processing Data')),
                //       );
                //     }
                //   },
                //   child: const Text('Submit'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class yazialanim extends StatefulWidget {
  yazialanim(
      {Key? key,
      required this.hintText,
      required this.inputType,
      this.isPassword = true,
      this.isPrivete = false,
      this.inputAction = TextInputAction.done,
      this.myValidator,
      this.myonSaved})
      : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final bool isPassword;
  bool isPrivete;
  TextInputAction inputAction;
  String? Function(String?)? myValidator;
  Function(String?)? myonSaved;

  @override
  State<yazialanim> createState() => _yazialanimState();
}

class _yazialanimState extends State<yazialanim> {
  late String username;
  late String password;

  changeIsPrivete() {
    setState(() {
      widget.isPrivete = !widget.isPrivete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: kBodyText.copyWith(
          color: Colors.white,
        ),
        obscureText: widget.isPrivete,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: changeIsPrivete,
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: kBodyText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        validator: widget.myValidator ??
            (value) {
              if (value!.isEmpty) {
                TextStyle(fontFamily: 'OuterSans', color: Colors.grey);
                return 'Alanı Boş Bırakmayınız';
              } else {
                return null;
              }
            },
        onSaved: widget.myonSaved ??
            (value) {
              //  widget.model.email = value!;
            },
      ),
    );
  }
}


