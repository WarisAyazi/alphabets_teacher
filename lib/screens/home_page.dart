import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sign_app/components/curve_painter.dart';
import 'package:sign_app/screens/alphabets_page.dart';
import 'package:sign_app/screens/multiple_syllable.dart';
import 'package:sign_app/screens/one_syllable.dart';
import 'package:sign_app/screens/three_syllable.dart';
import 'package:sign_app/screens/two_syllable.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
    return Scaffold(
      // backgroundColor: Color.fromRGBO(30, 41, 59, 1),
      backgroundColor: Color.fromRGBO(25, 35, 54, 1),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/single-litter.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  'Start Learning ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(height: 300),
                  items: cards.map((card) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            navigateToPage(context, card);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 20, sigmaY: 30),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  // margin: EdgeInsets.symmetric(horizontal: 2.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white24, width: 3),
                                      // color: Colors.indigo[900],
                                      color: Colors.transparent),
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
                SizedBox(height: 30),
                CustomPaint(
                  size: Size(400, 5),
                  painter: CurvePainter(),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Km-challenges.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black38),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start Challenges',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Solve Real World Challenges, problems and test your Skills.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.blue, Colors.black38],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white24,
                                    width: 2,
                                  ),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Start Challenge',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ),
                ),

                SizedBox(height: 20),

                CustomPaint(
                  size: Size(400, 5),
                  painter: CurvePainter(),
                ),

                Container(
                  height: 280,
                  child: Image.asset(
                    'assets/masha-the-bear.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

