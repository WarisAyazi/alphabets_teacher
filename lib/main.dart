import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sign_app/screens/multiple_syllable.dart';
import 'package:sign_app/screens/one_syllable.dart';
import 'package:sign_app/screens/three_syllable.dart';
import 'package:sign_app/screens/two_syllable.dart';
import 'screens/alphabets_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<String> cards = [
    'Aphabets',
    'Single Words',
    'Double Words',
    'Tripple Words',
    'More words'
  ];

  void navigateToPage(BuildContext context, String card) {
    Widget page;

    switch (card) {
      case 'Aphabets':
        page = AlphabetsPage();
        break;
      case 'Single Words':
        page = OneSyllable();
        break;
      case 'Double Words':
        page = TwoSyllable();
        break;
      case 'Tripple Words':
        page = ThreeSyllable();
        break;
      case 'More words':
        page = MultipleSyllable();
        break;
      default:
        page = Scaffold(
          appBar: AppBar(title: Text("Unknown")),
          body: Center(child: Text("Unknown Page")),
        );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color.fromRGBO(30, 41, 59, 1),
        backgroundColor: Color.fromRGBO(25, 35, 54, 1),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  'Start Learning',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: cards.map((card) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            navigateToPage(context, card);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.indigo[900],
                            ),
                            child: Center(
                              child: Text(
                                card,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  height: 400,
                  child: Image.asset(
                    'assets/masha-the-bear.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}