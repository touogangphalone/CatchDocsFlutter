import 'dart:math';

import 'package:flutter/material.dart';

class Notification {
  final String title;
  final String message;
  final Color color;
  final DateTime date;

  Notification({this.title, this.message, this.date, this.color});
}

class NotificationScreen extends StatelessWidget {
  // final List<Notification> notifications = [    Notification(      title: 'Nouveau devoir',      message: 'Un nouveau devoir est disponible pour la classe de mathématiques.',      date: DateTime(2022, 4, 1, 10, 0),      color: Colors.blue[100],
  //   ),
  //   Notification(
  //     title: 'Fête de l\'école',
  //     message: 'La fête de l\'école aura lieu le 15 avril. Soyez prêts !',
  //     date: DateTime(2022, 3, 28, 16, 30),
  //     color: Colors.green[100],
  //   ),
  //   Notification(
  //     title: 'Réunion parents-professeurs',
  //     message: 'La réunion parents-professeurs aura lieu le 2 avril à 18h.',
  //     date: DateTime(2022, 3, 25, 8, 15),
  //     color: Colors.pink[100],
  //   ),
  //   Notification(
  //     title: 'Rappel de devoir',
  //     message: 'N\'oubliez pas que le devoir de mathématiques est à rendre demain !',
  //     date: DateTime(2022, 3, 24, 17, 0),
  //     color: Colors.orange[100],
  //   ),
  // ];
// final List<Color> colors = List.generate(50, (index) => Colors.accents[Random().nextInt(Colors.accents.length)]);
  
 static List<Color> _colors = List.generate(
      50, (index) => Colors.accents[Random().nextInt(Colors.accents.length)]);

  List<Notification> notifications = List.generate(100, (index) {
    return Notification(
      title: 'Notification $index',
      message: 'Ceci est la notification n°$index.',
      date: DateTime.now(),
      color: _colors[Random().nextInt(_colors.length)],
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: notifications[index].color,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(notifications[index].title),
              subtitle: Text(notifications[index].message),
              trailing: Text(
                '${notifications[index].date.day}/${notifications[index].date.month}/${notifications[index].date.year}',
              ),
            ),
          );
        },
      ),
    );
  }
}
