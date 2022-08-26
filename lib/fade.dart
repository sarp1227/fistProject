import 'dart:async';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/hosgeldinizsayfasi.dart';
import '../widget/buton.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Fade Example';
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State with TickerProviderStateMixin {
// Whether the green box should be visible
  bool _visible = true;
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  @override
  void initState() {
//TODO: implement initState
    super.initState();
    Timer(
      const Duration(microseconds: 100),
      () => {
        setState(
          () {
            _visible = !_visible;
          },
        )
      },
    );

    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _heartAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            curve: Curves.easeOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.reverse().then((value) => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WelcomPage()))
            });
      }
    });
    _heartAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: kBackgroundColor,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _heartAnimationController,
                    builder: (context, child) {
                      return Center(
                        child: Container(
                          height: 250,
                          alignment: Alignment.center,
                          child: Opacity(
                            opacity: _heartAnimation.value,
                            child: Image.asset(
                              'assets/images/logo3.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
