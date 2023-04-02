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

                      return Card(
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


// import 'package:flutter/material.dart';
// import 'package:quizstar/screens/style/theme.dart';

// class HomeClasseScreens extends StatefulWidget {
//   static const routeName = '/classe-screens';

//   @override
//   // ignore: library_private_types_in_public_api
//   State<HomeClasseScreens> createState() => _HomeClasseScreensState();
// }

// class _HomeClasseScreensState extends State<HomeClasseScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: Text("Niveau"),
//         //   centerTitle: true,
//         //   backgroundColor: blueColor,
//         // ),
//         backgroundColor: Color(0xFFF5F5F5),
//         body: SafeArea(
//           child: ListView(
//             children: <Widget>[
//               /* Padding(
//                   padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
//                   child: new Theme(
//                     data: ThemeData(
//                       primaryColor: Colors.purpleAccent,
//                       primaryColorDark: Colors.red,
//                     ),
//                     child: TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderSide: new BorderSide(color: Colors.white)),
//                         labelText: 'Search',
//                         prefixIcon: const Icon(
//                           Icons.search,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   )),*/
//               Card(
//                 margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     radius: 22.0,
//                     backgroundColor: Colors.purpleAccent,
//                     child: CircleAvatar(
//                       radius: 21,
//                       backgroundImage: AssetImage('assets/1.png'),
//                     ),
//                   ),
//                   title: Text('6ième'),
//                   subtitle: Text('Sixième'),
//                   trailing: Icon(
//                     Icons.school,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//               Card(
//                 margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     radius: 22.0,
//                     backgroundColor: Colors.purpleAccent,
//                     child: CircleAvatar(
//                       radius: 21,
//                       backgroundImage: AssetImage('assets/1.png'),
//                     ),
//                   ),
//                   title: Text('5ième'),
//                   subtitle: Text('Cinquième'),
//                   trailing: Icon(
//                     Icons.school,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//               Card(
//                 margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     radius: 22.0,
//                     backgroundColor: Colors.purpleAccent,
//                     child: CircleAvatar(
//                       radius: 21,
//                       backgroundImage: AssetImage('assets/1.png'),
//                     ),
//                   ),
//                   title: Text('4ième'),
//                   subtitle: Text(''),
//                   trailing: Icon(Icons.school, color: Colors.green),
//                 ),
//               ),
//               Card(
//                 margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     radius: 22.0,
//                     backgroundColor: Colors.purpleAccent,
//                     child: CircleAvatar(
//                       radius: 21,
//                       backgroundImage: AssetImage('assets/1.png'),
//                     ),
//                   ),
//                   title: Text('3ième'),
//                   subtitle: Text('Troisième'),
//                   trailing: Icon(
//                     Icons.school,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//               Card(
//                 margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     radius: 22.0,
//                     backgroundColor: Colors.purpleAccent,
//                     child: CircleAvatar(
//                       radius: 21,
//                       backgroundImage: AssetImage('assets/1.png'),
//                     ),
//                   ),
//                   title: Text('2nde A'),
//                   subtitle: Text('Seconde serie A'),
//                   trailing: Icon(Icons.school, color: Colors.green),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//   Card(
            //     margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         radius: 22.0,
            //         backgroundColor: Colors.purpleAccent,
            //         child: CircleAvatar(
            //           radius: 21,
            //           backgroundImage: AssetImage('assets/1.png'),
            //         ),
            //       ),
            //       title: Text('2nde C'),
            //       subtitle: Text('Seconde serie C'),
            //       trailing: Icon(Icons.school, color: Colors.green),
            //     ),
            //   ),
            //   Card(
            //     margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         radius: 22.0,
            //         backgroundColor: Colors.purpleAccent,
            //         child: CircleAvatar(
            //           radius: 21,
            //           backgroundImage: AssetImage('assets/1.png'),
            //         ),
            //       ),
            //       title: Text('1ère A'),
            //       subtitle: Text('Première série A'),
            //       trailing: Icon(
            //         Icons.school,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),
            //   Card(
            //     margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         radius: 22.0,
            //         backgroundColor: Colors.purpleAccent,
            //         child: CircleAvatar(
            //           radius: 21,
            //           backgroundImage: AssetImage('assets/1.png'),
            //         ),
            //       ),
            //       title: Text('1ère C'),
            //       subtitle: Text('Première série C'),
            //       trailing: Icon(
            //         Icons.school,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),
            //   Card(
            //     margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         radius: 22.0,
            //         backgroundColor: Colors.purpleAccent,
            //         child: CircleAvatar(
            //           radius: 21,
            //           backgroundImage: AssetImage('assets/1.png'),
            //         ),
            //       ),
            //       title: Text('1ère D'),
            //       subtitle: Text('Première série D'),
            //       trailing: Icon(
            //         Icons.school,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),
            //   Card(
            //     margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         radius: 22.0,
            //         backgroundColor: Colors.purpleAccent,
            //         child: CircleAvatar(
            //           radius: 21,
            //           backgroundImage: AssetImage('assets/1.png'),
            //         ),
            //       ),
            //       title: Text('Tle A'),
            //       subtitle: Text('Terminale série A'),
            //       trailing: Icon(
            //         Icons.school,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),
            //   Card(
            //     margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         radius: 22.0,
            //         backgroundColor: Colors.purpleAccent,
            //         child: CircleAvatar(
            //           radius: 21,
            //           backgroundImage: AssetImage('assets/1.png'),
            //         ),
            //       ),
            //       title: Text('Tle C'),
            //       subtitle: Text('Terminale série C'),
            //       trailing: Icon(
            //         Icons.school,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),
            //   Card(
            //     margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         radius: 22.0,
            //         backgroundColor: Colors.purpleAccent,
            //         child: CircleAvatar(
            //           radius: 21,
            //           backgroundImage: AssetImage('assets/1.png'),
            //         ),
            //       ),
            //       title: Text('Tle D'),
            //       subtitle: Text('Terminale série D'),
            //       trailing: Icon(
            //         Icons.school,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),
             