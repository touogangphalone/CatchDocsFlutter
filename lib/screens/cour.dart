import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:quizstar/screens/style/theme.dart';

class CourScreens extends StatefulWidget {
  static const routeName = '/cour-screens';

  @override
  // ignore: library_private_types_in_public_api
  State<CourScreens> createState() => _CourScreensState();
}

class _CourScreensState extends State<CourScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Custom '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Cour'),
              Center(
                child: Wrap(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      height: 150,
                      width: 150,
                      elevation: 5,
                    ),
                    SizedBox(width: 5),
                    CustomCard(
                      Icons.book_online_rounded,
                      height: 150,
                      width: 150,
                      elevation: 5,
                      color: Colors.blue,
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
