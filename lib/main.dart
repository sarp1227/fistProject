import 'package:flutter/material.dart';
import 'package:flutter_application_1/fade.dart';
import 'package:hive/hive.dart';
import 'screens/hosgeldinizsayfasi.dart';
import 'constants.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
Future<void> main() async {
  await Hive.initFlutter();  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var visualDensity;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'deneme'),
   debugShowCheckedModeBanner: false,
    );
  
  }
}
