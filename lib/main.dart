import 'package:flutter/material.dart';
import 'package:quizstar/model/classes.dart';
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
      home: LoginScreens(),
      onGenerateRoute: (settings) {
        if (settings.name == '/classe/cour') {
          return MaterialPageRoute(builder: (context) => CourScreens());
        }
        return null;
      },
      routes: {
        '/home': (context) => HomeMain(),
        '/resgister': (context) => RegisterScreens(),
        '/otp': (context) => OtpPage(),
        '/cour': (context) => CourScreens(),
        '/classe': (context) => HomeClasseScreens(),
        // '/classe/cour': (context) => OtpPage(),
        
        // Ajoutez des routes pour vos autres pages ici
      },

      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
