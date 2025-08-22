import 'dart:ui';
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/single-litter.png'),
              fit: BoxFit.cover,
            ),
          ),
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
                  options: CarouselOptions(height: 380),
                  items: cards.map((card) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            navigateToPage(context, card);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 30),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  // margin: EdgeInsets.symmetric(horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white24, width: 3),
                                    // color: Colors.indigo[900],
                                    color: Colors.transparent
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
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  height: 280,
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
