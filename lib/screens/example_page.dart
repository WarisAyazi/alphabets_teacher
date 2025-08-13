import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  final String letter;
  const ExamplePage({
    super.key,
    required this.letter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exmple for $letter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Parastoo',
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              letter,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 150,
                fontWeight: FontWeight.bold,
                fontFamily: 'Parastoo',
              ),
            ),
          ),
          Image.asset('assets/masha-animation.png'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Elepsed: 00:00:00'), Text('Remining: 00:00:00')],
            ),
          )
        ],
      ),
    );
  }
}
