import 'package:flutter/material.dart';
import 'package:quizstar/widgets/app_drower.dart';

  class Concours {
  final String title;
  final String date;
  final String description;
  final String imageUrl;

  Concours({
    this.title,
    this.date,
    this.description,
    this.imageUrl,
  });
}

class ConcoursPage extends StatelessWidget {

  final List<Concours> concours = [
    Concours(
      title: 'Concours Mathématiques',
      date: '25 Juillet 2023',
      description:
          'Un concours pour les passionnés de mathématiques. Venez tester vos connaissances et remporter des prix en espèces!',
      imageUrl:
          'https://images.unsplash.com/photo-1629216228715-5af5f3b3d4b4?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Mjh8fHxlbnwwfHx8fDE2MjE0MzI1NjM&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Concours(
      title: 'Concours de Programmation',
      date: '30 Septembre 2023',
      description:
          'Un concours pour les programmeurs. Venez montrer vos compétences en résolvant des problèmes algorithmiques et gagner des prix en espèces!',
      imageUrl:
          'https://images.unsplash.com/photo-1543504668-4f4e4db4e9f6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzODl8fHxlbnwwfHx8fDE2MjE0MzI5MjE&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Concours(
      title: 'Concours de Science',
      date: '15 Novembre 2023',
      description:
          'Un concours pour les passionnés de science. Venez tester vos connaissances en biologie, physique et chimie et remporter des prix en espèces!',
      imageUrl:
          'https://images.unsplash.com/photo-1551837246-b43d666e45c8?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3ODV8fHxlbnwwfHx8fDE2MjE0MzI5NjE&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
  ];
@override
Widget build(BuildContext context) {
  return Scaffold(
    drawer: AddDrower(),
    appBar: AppBar(
      title: Text('Liste des concours'),
    ),
    body: ListView.builder(
      itemCount: concours.length,
      itemBuilder: (context, index) {
        final concoursItem = concours[index];
        return ListTile(
          leading: Image.network(concoursItem.imageUrl),
          title: Text(concoursItem.title),
          subtitle: Text(concoursItem.date),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(concours: concoursItem),
              ),
            );
          },
        );
      },
    ),
  );
}
}

DetailPage({Concours concours}) {
}
