import 'package:flutter/material.dart';
import 'package:quizstar/screens/style/theme.dart';

class HomeClasseScreens extends StatefulWidget {
  static const routeName = '/classe-screens';

  @override
  State<HomeClasseScreens> createState() => _HomeClasseScreensState();
}

class _HomeClasseScreensState extends State<HomeClasseScreens> {

  // Définir une liste de classes par niveau d'enseignement
  Map<String, List<String>> classes = {
    'Classes intermmediaire': ['6ème', '5ème', '4ème', '2nde A',],
    'Classes d\'examen': [ '3ème','1ère S', '1ère L', 'Terminale S', 'Terminale L'],
  };

   @override
  Widget build(BuildContext context) {
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
                          Navigator.pushNamed(context, '/classe/cour');
                          // Action à exécuter lorsque l'élément de la liste est cliqué
                          print('Element de la liste cliqué: $levelClass');
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
