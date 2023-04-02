import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourScreens extends StatefulWidget {
  static const routeName = '/cour-screens';

  @override
  State<CourScreens> createState() => _CourScreensState();
}

class _CourScreensState extends State<CourScreens> {
  final List<Map<String, dynamic>> _cours = [
    {
      'title': 'Mathématiques',
      'color': Colors.blue,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Informatique',
      'color': Colors.purple,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Physique',
      'color': Colors.green,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Chimie',
      'color': Colors.red,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Histoire',
      'color': Colors.orange,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Géographie',
      'color': Colors.yellow,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Informatique',
      'color': Colors.purple,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Physique',
      'color': Colors.green,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Chimie',
      'color': Colors.red,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Histoire',
      'color': Colors.orange,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Géographie',
      'color': Colors.yellow,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Géographie',
      'color': Colors.yellow,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Informatique',
      'color': Colors.purple,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Physique',
      'color': Colors.green,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Chimie',
      'color': Colors.red,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Histoire',
      'color': Colors.orange,
      'icon': 'assets/icons/signup.svg',
    },
    {
      'title': 'Géographie',
      'color': Colors.yellow,
      'icon': 'assets/icons/signup.svg',
    },
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: _cours.length,
            itemBuilder: (BuildContext ctx, int index) {
              final cours = _cours[index];
              return InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: cours['color'],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        cours['icon'],
                        height: 60,
                      ),
                      SizedBox(height: 10),
                      Text(
                        cours['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: GridView.builder(
//             itemCount: _cours.length,
//             itemBuilder: (BuildContext ctx, int index) {
//               final cours = _cours[index];
//               return InkWell(
//                 onTap: () {},
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: cours['color'],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         cours['icon'],
//                         height: 60,
//                       ),
//                       Text(
//                         cours['title'],
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
//           ),
//         ),
//       ),
//     );
//   }
// }
