import 'package:flutter/material.dart';

class ContestResult {
  final String name;
  final String winner;
  final String prize;
  final String image;

  ContestResult({
    this.name,
    this.winner,
    this.prize,
    this.image,
  });
}

class ContestResultsScreen extends StatelessWidget {
  final List<ContestResult> _contestResults = [
    ContestResult(
      name: 'Concours de mathématiques',
      winner: 'Jean Dupont',
      prize: '500 Fcfa',
      image: 'https://cdn-icons-png.flaticon.com/512/1083/1083770.png',
    ),
    ContestResult(
      name: 'Concours de mathématiques',
      winner: 'Alice Martin',
      prize: '300 Fcfa',
      image: 'https://cdn-icons-png.flaticon.com/512/1083/1083770.png',
    ),
    ContestResult(
      name: 'Concours de mathématiques',
      winner: 'Julie Rousseau',
      prize: '250 Fcfa',
      image: 'https://cdn-icons-png.flaticon.com/512/1083/1083770.png',
    ),
    ContestResult(
      name: 'Concours de mathématiques',
      winner: 'Simon Leblanc',
      prize: '200 Fcfa',
      image: 'https://cdn-icons-png.flaticon.com/512/1083/1083770.png',
    ),
    ContestResult(
      name: 'Concours de mathématiques',
      winner: 'Marie Dubois',
      prize: '150 Fcfa',
      image: 'https://cdn-icons-png.flaticon.com/512/1083/1083770.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.0),
          Center(
            child: Text(
              'Les 5 premiers gagnants',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                final contestResult = _contestResults[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.network(
                        contestResult.image,
                        height: 60,
                        width: 60,
                      ),
                      title: Text(
                        contestResult.winner,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        contestResult.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: Text(
                        contestResult.prize,
                        style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}