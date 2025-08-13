import 'package:flutter/material.dart';

import '../components/hover_letters.dart';

class MultipleSyllable extends StatelessWidget {
  MultipleSyllable({super.key});
  final List<String> letters = [
    'آب و هوا',
    'آشپزخانه',
    'آغازکردن',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Three Syllable'),
      ),
      backgroundColor: Color.fromRGBO(25, 35, 54, 1),
      body: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: letters
                      .map((letter) => HoverLetter(letter: letter))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
