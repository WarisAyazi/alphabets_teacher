import 'package:flutter/material.dart';
import 'package:sign_app/components/hover_letters.dart';

class Letter {
  final String word;
  final String voice;
  Letter({required this.word, required this.voice});
}

class AlphabetsPage extends StatelessWidget {
  final List<Letter> letters = [
    Letter(word: 'آ', voice: 'voices/Voice 001.m4a'),
    Letter(word: 'ا', voice: 'voices/Voices 001.m4a'),
    Letter(word: 'ب', voice: 'voices/Voice 002.m4a'),
    Letter(word: 'پ', voice: 'voices/Voice 003.m4a'),
    Letter(word: 'ت', voice: 'voices/Voice 004.m4a'),
    Letter(word: 'ث', voice: 'voices/Voice 005.m4a'),
    Letter(word: 'ج', voice: 'voices/Voice 006.m4a'),
    Letter(word: 'چ', voice: 'voices/Voice 007.m4a'),
    Letter(word: 'ح', voice: 'voices/Voice 008.m4a'),
    Letter(word: 'خ', voice: 'voices/Voice 009.m4a'),
    Letter(word: 'د', voice: 'voices/Voice 010.m4a'),
    Letter(word: 'ذ', voice: 'voices/Voice 011.m4a'),
    Letter(word: 'ر', voice: 'voices/Voice 012.m4a'),
    Letter(word: 'ز', voice: 'voices/Voice 013.m4a'),
    Letter(word: 'س', voice: 'voices/Voice 015.m4a'),
    Letter(word: 'ش', voice: 'voices/Voice 016.m4a'),
    Letter(word: 'ص', voice: 'voices/Voice 017.m4a'),
    Letter(word: 'ض', voice: 'voices/Voice 018.m4a'),
    Letter(word: 'ط', voice: 'voices/Voice 019.m4a'),
    Letter(word: 'ظ', voice: 'voices/Voice 020.m4a'),
    Letter(word: 'ع', voice: 'voices/Voice 021.m4a'),
    Letter(word: 'غ', voice: 'voices/Voice 022.m4a'),
    Letter(word: 'ف', voice: 'voices/Voice 023.m4a'),
    Letter(word: 'ق', voice: 'voices/Voice 024.m4a'),
    Letter(word: 'ک', voice: 'voices/Voice 025.m4a'),
    Letter(word: 'گ', voice: 'voices/Voice 026.m4a'),
    Letter(word: 'ل', voice: 'voices/Voice 027.m4a'),
    Letter(word: 'م', voice: 'voices/Voice 028.m4a'),
    Letter(word: 'ن', voice: 'voices/Voice 029.m4a'),
    Letter(word: 'و', voice: 'voices/Voice 030.m4a'),
    Letter(word: 'ه', voice: 'voices/Voice 031.m4a'),
    Letter(word: 'ی', voice: 'voices/Voice 032.m4a'),
  ];

  AlphabetsPage({super.key});

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
