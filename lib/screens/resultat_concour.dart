import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Participant {
  final String name;
  final int score;
  final DateTime date;

  Participant({
    this.name,
    this.score,
    this.date,
  });
}

class ResultatConcourScreen extends StatefulWidget {
  @override
  _ResultatConcourScreenState createState() => _ResultatConcourScreenState();
}

class _ResultatConcourScreenState extends State<ResultatConcourScreen> {
  final List<Participant> _participants = [
    Participant(
      name: 'Sophie Leclerc',
      score: 80,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Participant(
      name: 'Emilie Durand',
      score: 85,
      date: DateTime.now(),
    ),  
    Participant(
    name: 'John Smith',
    score: 75,
    date: DateTime.now().subtract(Duration(days: 5)),
  ),
  Participant(
    name: 'Jane Doe',
    score: 90,
    date: DateTime.now(),
  ),
  Participant(
    name: 'David Johnson',
    score: 82,
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Participant(
    name: 'Maria Garcia',
    score: 79,
    date: DateTime.now().subtract(Duration(days: 4)),
  ),
  Participant(
    name: 'Juan Martinez',
    score: 87,
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  Participant(
    name: 'Michelle Davis',
    score: 93,
    date: DateTime.now().subtract(Duration(days: 3)),
  ),
  Participant(
    name: 'Mohamed Ali',
    score: 76,
    date: DateTime.now().subtract(Duration(days: 6)),
  ),
  Participant(
    name: 'Emilie Martin',
    score: 84,
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  Participant(
    name: 'Alexandra Brown',
    score: 89,
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Participant(
    name: 'Thomas Wilson',
    score: 83,
    date: DateTime.now().subtract(Duration(days: 3)),
  ),
  Participant(
    name: 'Amanda Lee',
    score: 80,
    date: DateTime.now().subtract(Duration(days: 4)),
  ),
  Participant(
    name: 'Samuel Anderson',
    score: 86,
    date: DateTime.now(),
  ),
  Participant(
    name: 'Laura Thompson',
    score: 77,
    date: DateTime.now().subtract(Duration(days: 5)),
  ),
  Participant(
    name: 'Ethan Baker',
    score: 93,
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  Participant(
    name: 'Julia Allen',
    score: 81,
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Participant(
    name: 'Miguel Hernandez',
    score: 78,
    date: DateTime.now().subtract(Duration(days: 4)),
  ),
  Participant(
    name: 'Ella Wright',
    score: 88,
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  Participant(
    name: 'Brandon Thomas',
    score: 85,
    date: DateTime.now().subtract(Duration(days: 3)),
  ),
  Participant(
    name: 'Chloe Robinson',
    score: 79,
    date: DateTime.now().subtract(Duration(days: 4)),
  ),
  Participant(
    name: 'Noah King',
    score: 93,
    date: DateTime.now(),
  ),
  Participant(
    name: 'Sofia Hernandez',
    score: 76,
    date: DateTime.now().subtract(Duration(days: 6)),
  ),
  Participant(
    name: 'Justin Green',
    score: 82,
    date: DateTime.now().subtract(Duration(days: 3)),
  ),
  Participant(
    name: 'Isabella Taylor',
    score: 88,
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  Participant(
    name: 'Michael Brown',
    score: 90,
    date: DateTime.now(),
  ),
  ];

  final List<Color> _itemColors = [
    Colors.red[50],
    Colors.orange[50],
    Colors.yellow[50],
    Colors.green[50],
    Colors.blue[50],
  ];

  final TextEditingController _searchController = TextEditingController();
  List<Participant> _displayedParticipants = [];

  @override
  void initState() {
    super.initState();
    _displayedParticipants = _participants;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  void _sortParticipants() {
    // Sort participants by score, then by date and time in case of ties
    _displayedParticipants.sort((a, b) {
      if (a.score != b.score) {
        return b.score.compareTo(a.score);
      } else {
        return a.date.compareTo(b.date);
      }
    });
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    _sortParticipants();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name',
              ),
              onChanged: (text) {
                setState(() {
                  _displayedParticipants = _participants
                      .where((participant) => participant.name
                          .toLowerCase()
                          .contains(text.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _displayedParticipants.length,
              itemBuilder: (context, index) {
                final participant = _displayedParticipants[index];
                final originalIndex = _participants.indexOf(participant);
                final colorIndex = originalIndex % _itemColors.length;
                final itemColor = _itemColors[colorIndex];
                final formattedDate =
                    DateFormat.yMd().add_jm().format(participant.date);
                return Container(
                  color: itemColor,
                  child: ListTile(
                    leading: Text('${originalIndex + 1}'),
                    title: Text(participant.name),
                    subtitle: Text('Score: ${participant.score} \nDate d\'insciption $formattedDate'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}