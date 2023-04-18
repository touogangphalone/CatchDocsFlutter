import 'package:flutter/material.dart';
import 'package:quizstar/widgets/app_drower.dart';

class Message {
  final String sender;
  final String content;
  final DateTime dateTime;

  Message({ this.sender,  this.content,  this.dateTime});
}

class AdminDiscussionScreen extends StatefulWidget {
  @override
  _AdminDiscussionScreenState createState() => _AdminDiscussionScreenState();
}

class _AdminDiscussionScreenState extends State<AdminDiscussionScreen> {
  List<Message> _discussions = [    
      Message(
          sender: 'Alice',
          content: 'Bonjour tout le monde',
          dateTime: DateTime(2022, 10, 10, 10, 0), 
        ),
        Message(
          sender: 'Bob',
          content: 'Salut Alice',
          dateTime: DateTime(2022, 10, 10, 10, 5), 
        ),
        Message(
          sender: 'Charlie',
          content: 'Bonjour à tous',
          dateTime: DateTime(2022, 10, 10, 10, 10),    
        ),  
      Message(
          sender: 'Alice',
          content: 'Bonjour tout le monde',
          dateTime: DateTime(2022, 10, 10, 10, 0), 
        ),
        Message(
          sender: 'Bob',
          content: 'Salut Alice',
          dateTime: DateTime(2022, 10, 10, 10, 5), 
        ),
        Message(
          sender: 'Charlie',
          content: 'Bonjour à tous',
          dateTime: DateTime(2022, 10, 10, 10, 10),    
        ),  
      Message(
          sender: 'Alice',
          content: 'Bonjour tout le monde',
          dateTime: DateTime(2022, 10, 10, 10, 0), 
        ),
        Message(
          sender: 'Bob',
          content: 'Salut Alice',
          dateTime: DateTime(2022, 10, 10, 10, 5), 
        ),
        Message(
          sender: 'Charlie',
          content: 'Bonjour à tous',
          dateTime: DateTime(2022, 10, 10, 10, 10),    
        ),  
      Message(
          sender: 'Alice',
          content: 'Bonjour tout le monde',
          dateTime: DateTime(2022, 10, 10, 10, 0), 
        ),
        Message(
          sender: 'Bob',
          content: 'Salut Alice',
          dateTime: DateTime(2022, 10, 10, 10, 5), 
        ),
        Message(
          sender: 'Charlie',
          content: 'Bonjour à tous',
          dateTime: DateTime(2022, 10, 10, 10, 10),    
        ),  
      Message(
          sender: 'Alice',
          content: 'Bonjour tout le monde',
          dateTime: DateTime(2022, 10, 10, 10, 0), 
        ),
        Message(
          sender: 'Bob',
          content: 'Salut Alice',
          dateTime: DateTime(2022, 10, 10, 10, 5), 
        ),
        Message(
          sender: 'Charlie',
          content: 'Bonjour à tous',
          dateTime: DateTime(2022, 10, 10, 10, 10),    
        ),
  ];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _discussions.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return Scaffold(
      // drawer: AddDrower(),
      appBar: AppBar(
        title: Text('Ecrire à l\'administration en cas de problème'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _discussions.length,
              itemBuilder: (context, index) {
                final message = _discussions[index];
                return Row(
                  mainAxisAlignment: message.sender == 'Alice'
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: message.sender == 'Alice' ? Colors.grey[300] : Colors.blue[400],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.sender,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: message.sender == 'Alice' ? Colors.black : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            message.content,
                            style: TextStyle(
                              color: message.sender == 'Alice' ? Colors.black : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                message.sender == 'Alice' ? Icons.done_all : Icons.done,
                                color: message.sender == 'Alice' ? Colors.grey : Colors.white,
                                size: 18.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '${message.dateTime.hour}:${message.dateTime.minute}',
                                style: TextStyle(
                                  color:
                                      message.sender == 'Alice' ? Colors.black : Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:
                                    _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Entrez votre message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: () {
                // Ajouter le message à la liste des discussions
                setState(() {
                  _discussions.insert(
                    0,
                    Message(
                      sender: 'Alice',
                      content: _textEditingController.text,
                      dateTime: DateTime.now(),
                    ),
                  );
                  _textEditingController.clear();
                });
              },
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    ],
  ),
);
}
}
