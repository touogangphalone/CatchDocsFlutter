import 'package:quizstar/provider/alert_provider.dart';
import 'package:quizstar/screens/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:quizstar/model/classes.dart';
import 'package:quizstar/screens/HomeMain.dart';
import 'package:quizstar/screens/admin_discution.dart';
import 'package:quizstar/screens/apropos.dart';
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

class HomeClasseScreens extends StatefulWidget {
  static const routeName = '/classe-screens';

  @override
  State<HomeClasseScreens> createState() => _HomeClasseScreensState();
}

class _HomeClasseScreensState extends State<HomeClasseScreens> {

    final AlertProvider alertProvider = AlertProvider();
  // Définir une liste de classes par niveau d'enseignement
  Map<String, List<String>> classes = {
    'Classes intermmediaire': ['6ème', '5ème', '4ème', '2nde A',],
    'Classes d\'examen': [ '3ème','1ère S', '1ère L', 'Terminale S', 'Terminale L'],
  };

   @override
  Widget build(BuildContext context) {
    alertProvider.addItem('Forfait jour', () => Navigator.pushNamed(context, '/cour'));
    alertProvider.addItem('Forfait mois', () => Navigator.pushNamed(context, '/cour'));
    alertProvider.addItem('Forfait annuel', () => Navigator.pushNamed(context, '/cour'));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: SafeArea(
          child: ListView.builder(
            itemCount: classes.length,
            itemBuilder: (BuildContext context, int index) {
              String category = classes.keys.elementAt(index);
              List<String> levelClasses = classes[category];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      category,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: levelClasses.length,
                    itemBuilder: (BuildContext context, int index) {
                      String levelClass = levelClasses[index];
                      return GestureDetector(
                        onTap: () {

                          // alertProvider.showChangePasswordAlert(context);

                          alertProvider.showAlertListToSelect(context, "Liste des forfaits");
                          // alertProvider.remove();
                          // alertProvider.showAlert(context, 'Titre de l\'alerte', 'Message de l\'alerte');

                          // alertProvider.showEditProfileDialog(context);
          
                          // Navigator.pushNamed(context, '/classe/cour');
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 22.0,
                              backgroundColor: Colors.purpleAccent,
                              child: CircleAvatar(
                                radius: 21,
                                backgroundImage: AssetImage('assets/1.png'),
                              ),
                            ),
                            title: Text(levelClass),
                            subtitle: Text(''),
                            trailing: Icon(Icons.school, color: Colors.green),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
