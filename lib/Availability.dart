import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FinalStep.dart';
import 'ResetPassword.dart';
import 'Slots.dart';
import 'StudentPage.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  final double appBarPadding = 20.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> imageInfo = [
    {'title': 'Mon'},
    {'title': 'Tue'},
    {'title': 'Wed'},
    {'title': 'Thu'},
    {'title': 'Fri'},
    {'title': 'Sat'},
    {'title': 'Sun'},
  ];

  int? tappedIndex; // To keep track of tapped image index


  double _padding = 6.0;
  final _formKey = GlobalKey<FormState>();

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
                            "    My Availability ",
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


                  SizedBox(height: 490),
                  GestureDetector(
                    onTapDown: (_) => setState(() {
                      _padding = 0.0;
                    }),
                    onTapUp: (_) => setState(() {
                      _padding = 6.0;
                    }),
                    onTap: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Slots()),
                        );
                      }
                    },
                    child: AnimatedContainer(
                      padding: EdgeInsets.only(bottom: _padding),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      duration: const Duration(milliseconds: 70),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 118,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD700),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Add New Slot",
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
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
