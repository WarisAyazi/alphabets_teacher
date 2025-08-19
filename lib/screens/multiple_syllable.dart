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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/single-litter.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  physics: NeverScrollableScrollPhysics(),
                  children: letters
                      .map((letter) => HoverLetter(word: letter, voice: letter))
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
