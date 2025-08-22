import 'package:flutter/material.dart';
import 'package:sign_app/components/hover_letters.dart';
import 'package:sign_app/words.dart';

class AlphabetsPage extends StatelessWidget {
  const AlphabetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aphabets'),
        elevation: 1.5,
        backgroundColor: Color.fromRGBO(25, 35, 54, 0.9),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color.fromRGBO(25, 35, 54, 1),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/single-litter.png'),
              fit: BoxFit.cover,
            ),
          ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 12,
                  children: letters
                      .map((letter) => HoverLetter(word: letter.word, voice: letter.voice,),)
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
