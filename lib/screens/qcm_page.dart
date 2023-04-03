import 'package:flutter/material.dart';

class QcmPage extends StatelessWidget {
  final List<String> _questions = [
    'Question 1',
    'Question 2',
    'Question 3',
  ];
  final List<List<String>> _choices = [
    ['Réponse 1', 'Réponse 2', 'Réponse 3'],
    ['Réponse 1', 'Réponse 2', 'Réponse 3'],
    ['Réponse 1', 'Réponse 2', 'Réponse 3'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QCM'),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _questions[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _choices[index].length,
                  itemBuilder: (BuildContext context, int choiceIndex) {
                    return RadioListTile(
                      title: Text(_choices[index][choiceIndex]),
                      groupValue: null,
                      value: null,
                      onChanged: null,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
