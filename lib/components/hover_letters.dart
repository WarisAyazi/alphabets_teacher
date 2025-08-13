import 'package:flutter/material.dart';
import 'package:sign_app/screens/example_page.dart';

class HoverLetter extends StatefulWidget {
  final String letter;

  HoverLetter({Key? key, required this.letter}) : super(key: key);

  @override
  _HoverLetterState createState() => _HoverLetterState();
}

class _HoverLetterState extends State<HoverLetter> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Colors.lightBlueAccent;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamplePage(letter: widget.letter),
            ),
          );
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isHovered ? Colors.blue[500] : Colors.indigo[900],
              border: Border.all(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                widget.letter,
                style: TextStyle(
                  fontFamily: 'Parastoo',
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
