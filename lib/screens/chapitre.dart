import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Détails du cours',
      home: CourseDetailsPage(),
    );
  }
}

class CourseDetailsPage extends StatelessWidget {
  final String fakeCourse = """
  Trigonométrie

  La trigonométrie est la branche des mathématiques qui traite des relations entre les côtés et les angles d'un triangle. Elle est utilisée dans de nombreux domaines, tels que la géométrie, la physique et l'ingénierie.

  Les fonctions trigonométriques de base sont le sinus, le cosinus et la tangente. Elles sont définies en termes des ratios des côtés opposés et adjacents d'un angle dans un triangle.

  La trigonométrie est également utilisée pour résoudre des problèmes liés aux vagues et aux oscillations, ainsi que pour modéliser des phénomènes périodiques tels que les mouvements planétaires.

  Apprenez-en plus sur la trigonométrie dans notre cours en ligne !  
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du cours'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trigonométrie',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              fakeCourse,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: Text('Voulez-vous effectuer le quiz ?'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//je veux le code très élégant sur flutter 2.10.3 d'une 
//page qui affiche les details d'un cour  
//avec un boutton a fin qui propose à l'étudiant
//d’effectuer le test 