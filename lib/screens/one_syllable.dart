import 'package:flutter/material.dart';
import 'package:sign_app/words.dart';
import '../components/hover_letters.dart';

class OneSyllable extends StatelessWidget {
  OneSyllable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One Syllable'),
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
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 12,
                  physics: NeverScrollableScrollPhysics(),
                  children: single_letters
                      .map(
                        (letter) => HoverLetter(
                          word: letter,
                          voice: letter,
                        ),
                      )
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
