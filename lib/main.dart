import 'package:flutter/material.dart';
import 'package:quizstar/l10n/en/app_localizations_en.dart';
import 'package:quizstar/l10n/fr/app_localizations_fr.dart';
import 'package:quizstar/model/classes.dart';
import 'package:quizstar/screens/HomeMain.dart';
import 'package:quizstar/screens/login_screens.dart';
import 'package:quizstar/splash.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:quizstar/l10n/app_localizations_en.dart';
// import 'package:quizstar/l10n/app_localizations_fr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Evaluation",
      home: LoginScreens(),
      routes: {
        '/login': (context) => LoginScreens(),
        '/home': (context) => HomeScreen()
        // '/classe/cour': (context) => OtpPage(),
        // Ajoutez des routes pour vos autres pages ici
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        const AppLocalizationsDelegatefr(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
