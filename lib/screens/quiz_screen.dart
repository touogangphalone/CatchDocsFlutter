  // je veux un code en flutter 2.10 Qui affiche les QCM a l'étudiant en lui permettant de 
  // de chosir les reponse a chaque. et après la reponse lui afficher le resultat ainsii que la 
  // justification. tu simulera les données a partir du tableau suivant : 

      
  import 'package:flutter/material.dart';

  // Données simulées
  final List<Map<String, dynamic>> quizData = [
    {
      'question': 'Quelle est la capitale de la France ?',
      'answers': [
        {'text': 'Paris', 'isCorrect': true},
        {'text': 'Berlin', 'isCorrect': false},
        {'text': 'Londres', 'isCorrect': false},
        {'text': 'Madrid', 'isCorrect': false},
      ],
      'justification': 'Paris est la capitale de la France depuis le 14e siècle.'
    },
    {
      'question': 'Quel est le plus grand pays du monde ?',
      'answers': [
        {'text': 'Russie', 'isCorrect': true},
        {'text': 'Canada', 'isCorrect': false},
        {'text': 'Chine', 'isCorrect': false},
        {'text': 'États-Unis', 'isCorrect': false},
      ],
      'justification': 'La Russie est le plus grand pays du monde en termes de superficie.'
    },
    {
      'question': 'Qui a peint la Joconde ?',
      'answers': [
        {'text': 'Leonardo da Vinci', 'isCorrect': true},
        {'text': 'Pablo Picasso', 'isCorrect': false},
        {'text': 'Vincent van Gogh', 'isCorrect': false},
        {'text': 'Rembrandt', 'isCorrect': false},
      ],
      'justification': 'La Joconde a été peinte par Leonardo da Vinci entre 1503 et 1506.'
    },
  ];

  class QuizScreen extends StatefulWidget {
    @override
    _QuizScreenState createState() => _QuizScreenState();
  }

  class _QuizScreenState extends State<QuizScreen> {
    int _currentIndex = 0;
    List<int> _selectedAnswers = List.filled(quizData.length, -1);

    void _selectAnswer(int index, int answerIndex) {
      setState(() {
        _selectedAnswers[index] = answerIndex;
      });
    }

    void _submitQuiz() {
      int correctAnswers = 0;
      for (int i = 0; i < quizData.length; i++) {
        if (quizData[i]['answers'][_selectedAnswers[i]]['isCorrect']) {
          correctAnswers++;
        }
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Résultat'),
            content: Text(
                'Vous avez obtenu un score de $correctAnswers / ${quizData.length}.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
      );
    }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Quiz'),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              quizData[_currentIndex]['question'],
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ...quizData[_currentIndex]['answers']
              .asMap()
              .entries
              .map((entry) => RadioListTile<int>(
                    title: Text(entry.value['text']),
                    value: entry.key,
                    groupValue: _selectedAnswers[_currentIndex],
                    onChanged: (value) {
                      _selectAnswer(_currentIndex, value);
                    },
                  ))
              .toList(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _currentIndex == quizData.length - 1
                  ? _submitQuiz
                  : () {
                      setState(() {
                        _currentIndex++;
                      });
                    },
              child: Text(
                _currentIndex == quizData.length - 1 ? 'Soumettre' : 'Suivant',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Quiz'),
//     ),
//     body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               quizData[_currentIndex]['question'],
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ...quizData[_currentIndex]['answers']
//               .asMap()
//               .entries
//               .map(
//                 (entry) => RadioListTile<int>(
//                   title: Text(entry.value['text']),
//                   value: entry.key,
//                   groupValue: _selectedAnswers[_currentIndex],
//                   onChanged: (int? value) {
//                     _selectAnswer(_currentIndex, value ?? -1);
//                   },
//                 ),
//               )
//               .toList(),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: _currentIndex == quizData.length - 1
//                   ? _submitQuiz
//                   : () {
//                       setState(() {
//                         _currentIndex++;
//                       });
//                     },
//               child: Text(
//                 _currentIndex == quizData.length - 1 ? 'Terminer' : 'Suivant',
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

}

  // tu n'as toujours pas finis le code