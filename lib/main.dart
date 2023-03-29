import 'package:flutter/material.dart';
import 'package:quizstar/screens/HomeMain.dart';
import 'package:quizstar/screens/classe_page.dart';
import 'package:quizstar/screens/cour.dart';
import 'package:quizstar/screens/login_screens.dart';
import 'package:quizstar/screens/otp_screens.dart';
import 'package:quizstar/screens/register_screens.dart';
import 'package:quizstar/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Evaluation",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      //home: splashscreen(),
      home: HomeMain(),
    );
  }
}
