import 'package:flutter/material.dart';
import 'package:quizstar/l10n/en/app_localizations_en.dart';
import 'package:quizstar/l10n/fr/app_localizations_fr.dart';
import 'package:quizstar/model/classes.dart';
import 'package:quizstar/screens/HomeMain.dart';
import 'package:quizstar/screens/admin_discution.dart';
import 'package:quizstar/screens/apropos.dart';
import 'package:quizstar/screens/chapitre.dart';
import 'package:quizstar/screens/chapitres.dart';
import 'package:quizstar/screens/classe_page.dart';
import 'package:quizstar/screens/concours_page.dart';
import 'package:quizstar/screens/contact_us.dart';
import 'package:quizstar/screens/cour.dart';
import 'package:quizstar/screens/forum.dart';
import 'package:quizstar/screens/login_screens.dart';
import 'package:quizstar/screens/otp_forgot_pasword.dart';
import 'package:quizstar/screens/otp_screens.dart';
import 'package:quizstar/screens/phone_number.dart';
import 'package:quizstar/screens/register_screens.dart';
import 'package:quizstar/screens/reset_password.dart';
import 'package:quizstar/screens/user_profile.dart';
import 'package:quizstar/screens/quiz_screen.dart';
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
      home: HomeMain(),
      // home: LoginScreens(),
      routes: {
        '/classe': (context) => HomeClasseScreens(),
        '/cour': (context) => CourScreens(),
        '/chapitre': (context) => ChapterList(),
        '/chapitre_detail': (context) => CourseDetailsPage(),
        '/quiz': (context) => QuizScreen(),
        '/login': (context) => LoginScreens(),
        '/home': (context) => HomeMain(),
        '/resgister': (context) => RegisterScreens(),
        '/otp': (context) => OtpPage(),
        '/otp-screnn': (context) => OtpScrenn(),
        '/profile': (context) => UserProfile(),
        '/concour': (context) => ConcoursPage(),
        '/admin': (context) => AdminDiscussionScreen(),
        '/forum': (context) => ForumDiscussionScreen(),
        '/contactez': (context) => ContactPage(),
        '/apropos': (context) => AboutScreen(),
        '/phonenumber': (context) => PhoneNumberPage(),
        '/reset-password': (context) => ChangePasswordScreen(),
        // '/classe/cour': (context) => OtpPage(),
        // Ajoutez des routes pour vos autres pages ici
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/classe/cour') {
          return MaterialPageRoute(
            builder: (BuildContext context) => CourScreens(),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeMain(),
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
