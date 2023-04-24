import 'package:flutter/material.dart';

class Chapter {
  final String libelle;
  final String description;

  Chapter({this.libelle, this.description});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      libelle: json['libelle'],
      description: json['description'],
    );
  }
}

class ChapterList extends StatelessWidget {
  
  final List<Map<String, dynamic>> fakeData = [
  {
    'libelle': 'Algèbre linéaire',
    'description': 'Étude des espaces vectoriels et des transformations linéaires',
  },
  {
    'libelle': 'Analyse réelle',
    'description': 'Étude des fonctions continues et dérivables',
  },
  {
    'libelle': 'Calcul différentiel',
    'description': 'Étude de la dérivation et de l\'intégration des fonctions',
  },
  {
    'libelle': 'Calcul intégral',
    'description': 'Étude de l\'intégration des fonctions sur des intervalles arbitraires',
  },
  {
    'libelle': 'Géométrie analytique',
    'description': 'Étude des courbes et des surfaces dans l\'espace',
  },
  {
    'libelle': 'Probabilités',
    'description': 'Étude des phénomènes aléatoires et de leur modélisation',
  },
  {
    'libelle': 'Statistiques',
    'description': 'Étude des méthodes pour l\'analyse de données',
  },
  {
    'libelle': 'Topologie',
    'description': 'Étude des espaces topologiques et des fonctions continues',
  },
];


  @override
  Widget build(BuildContext context) {
    List<Chapter> chapters = fakeData.map((chapter) => Chapter.fromJson(chapter)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des chapitres'),
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4.0,
            child: ListTile(
              title: Text(
                chapters[index].libelle,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                chapters[index].description,
                style: TextStyle(fontSize: 16.0),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                  Navigator.pushNamed(context, '/chapitre_detail');
                // do something when the user taps on the tile
              },
            ),
          );
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Chapter {
//   final String libelle;
//   final String description;

//   Chapter({this.libelle, this.description});

//   factory Chapter.fromJson(Map<String, dynamic> json) {
//     return Chapter(
//       libelle: json['libelle'],
//       description: json['description'],
//     );
//   }
// }

// class ChapterList extends StatefulWidget {
//   final int courseId;

//   ChapterList({this.courseId});

//   @override
//   _ChapterListState createState() => _ChapterListState();
// }

// class _ChapterListState extends State<ChapterList> {
//   List<Chapter> chapters;

//   @override
//   void initState() {
//     super.initState();
//     fetchChapters();
//   }

//   Future<void> fetchChapters() async {
//     final response = await http.get(Uri.parse('http://your-api-url.com/api/chapters/?course=${widget.courseId}'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         chapters = List<Chapter>.from(data.map((chapter) => Chapter.fromJson(chapter)));
//       });
//     } else {
//       throw Exception('Failed to load chapters');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Liste des chapitres'),
//       ),
//       body: ListView.builder(
//         itemCount: chapters.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(chapters[index].libelle),
//             subtitle: Text(chapters[index].description),
//           );
//         },
//       ),
//     );
//   }
// }
