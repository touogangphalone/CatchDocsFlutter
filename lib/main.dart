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
        if (settings.name == '/home') {
          return MaterialPageRoute(builder: (context) => HomeMain());
        } else if (settings.name == '/home/profile') {
          return MaterialPageRoute(builder: (context) => HomeClasseScreens());
        } else if (settings.name == '/home/resgister') {
          return MaterialPageRoute(builder: (context) => RegisterScreens());
        } else if (settings.name == '/home/otp') {
          return MaterialPageRoute(builder: (context) => OtpPage());
        } else if (settings.name == '/home/cour') {
          return MaterialPageRoute(builder: (context) => CourScreens());
        } else if (settings.name == '/home/classe') {
          return MaterialPageRoute(builder: (context) => HomeClasseScreens());
        } 
        return null;
            
      },
      routes: {
        '/resgister': (context) => RegisterScreens(),
        '/otp': (context) => OtpPage(),
        '/cour': (context) => CourScreens(),
        '/classe': (context) => HomeClasseScreens(),
        // Ajoutez des routes pour vos autres pages ici
      },

      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
