import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ResetPassword.dart';
import 'StudentPage.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final double appBarPadding = 20.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> imageInfo = [
    {'title': 'Class 1'},
    {'title': 'Class 2'},
    {'title': 'Class 3'},
    {'title': 'Class 4'},
    {'title': 'Class 5'},
    {'title': 'Class 6'},
  ];

  int? tappedIndex; // To keep track of tapped image index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFFD4),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(""),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "    Leaderboard ",
                            style: GoogleFonts.nunito(
                              fontSize: constraints.maxWidth * 0.06,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9),
                  Container(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageInfo.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              tappedIndex = index;
                            });
                          },
                          onTapUp: (_) {
                            setState(() {
                              tappedIndex = null;
                            });
                          },
                          onTapCancel: () {
                            setState(() {
                              tappedIndex = null;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            width: 70,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: tappedIndex == index ? Colors.red : Colors.white, // Change color based on tappedIndex
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTapDown: (_) {
                                  setState(() {
                                    tappedIndex = index;
                                  });
                                },
                                onTapUp: (_) {
                                  setState(() {
                                    tappedIndex = null;
                                  });
                                },
                                onTapCancel: () {
                                  setState(() {
                                    tappedIndex = null;
                                  });
                                },
                                child: Transform.scale(
                                  scale: tappedIndex == index ? 1.1 : 1.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0.57),
                                        child: Text(
                                          imageInfo[index]['title']!,
                                          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
