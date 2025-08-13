import 'package:flutter/material.dart';
import 'hover_letters.dart';

class GridSingleLetter extends StatelessWidget {
  // English letters A-Z
  final List<String> letters = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );

  GridSingleLetter({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Text(
              'Single Letters',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 12,
              children:
                  letters.map((letter) => HoverLetter(letter: letter)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
