import 'package:flutter/material.dart';

class QcmScreen extends StatefulWidget {
  @override
  _QcmScreenState createState() => _QcmScreenState();
}

class _QcmScreenState extends State<QcmScreen> {
  Object _selectedOptionIndex;

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['London', 'Paris', 'Madrid', 'Berlin'],
      'correctIndex': 1,
    },
    {
      'question': 'What is the tallest mountain in the world?',
      'options': ['Mount Everest', 'K2', 'Kilimanjaro', 'Matterhorn'],
      'correctIndex': 0,
    },
    {
      'question': 'What is the largest country in the world?',
      'options': ['Russia', 'Canada', 'China', 'USA'],
      'correctIndex': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QCM'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _questions.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _questions[index]['question'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: List.generate(
                          _questions[index]['options'].length,
                          (optionIndex) {
                            return RadioListTile(
                              title: Text(
                                _questions[index]['options'][optionIndex],
                              ),
                              value: optionIndex,
                              groupValue: _selectedOptionIndex,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOptionIndex = value;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: _selectedOptionIndex != null ? _submitAnswers : null,
          ),
        ],
      ),
    );
  }

  void _submitAnswers() {
    // TODO: Compute the results and show a dialog with the score
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Score'),
          content: Text('Your score is 2/3'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
