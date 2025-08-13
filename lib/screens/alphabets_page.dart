import 'package:flutter/material.dart';
import 'package:sign_app/components/hover_letters.dart';

class AlphabetsPage extends StatelessWidget {
  final List<String> letters = [
    'آ',
    'ا',
    'ب',
    'پ',
    'ت',
    'ث',
    'ج',
    'چ',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ک',
    'گ',
    'ل',
    'م',
    'ن',
    'و',
    'ه',
    'ی',
  ];
  // English letters A-Z
  // final List<String> letters = List.generate(
  //   26,
  //   (index) => String.fromCharCode(65 + index),
  // );

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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
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
