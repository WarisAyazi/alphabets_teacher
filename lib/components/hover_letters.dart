import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sign_app/screens/example_page.dart';

class HoverLetter extends StatefulWidget {
  final String word;
  final String voice;

  HoverLetter({
    Key? key,
    required this.word,
    required this.voice,
  }) : super(key: key);

  @override
  _HoverLetterState createState() => _HoverLetterState();
}

class _HoverLetterState extends State<HoverLetter> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamplePage(
                word: widget.word,
                voice: widget.voice,
              ),
            ),
          );
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 30),
              child: Container(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white24, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      '${widget.word}',
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
          ),
        ),
      ),
    );
  }
}
