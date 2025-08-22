import 'package:flutter/material.dart';
import 'package:sign_app/words.dart';
import '../components/hover_letters.dart';

class TwoSyllable extends StatelessWidget {
  TwoSyllable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Syllable'),
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
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  physics: NeverScrollableScrollPhysics(),
                  children: double_letters
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
