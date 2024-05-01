import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/StuDashboard.dart';
import 'package:scholars_sync/StudentPage.dart';

import 'routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _padding = 6.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      appBar: null,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Image.asset(
                'assets/images/1.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/images/children.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Text(
                "Welcome to Scholar's Sync",
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 13),
              Text(
                "Unlock Your Potential, One Lesson at a Time.",
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                    letterSpacing: -0.5,
                ),
              ),


              SizedBox(height: 30),
            GestureDetector(
              onTapDown: (_) => setState(() {
                _padding = 0.0;
              }),
              onTapUp: (_) => setState(() {
                _padding = 6.0;
              }) ,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentForm()),
                );
              },
              child: AnimatedContainer(
                padding: EdgeInsets.only(bottom: _padding),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)
                ),
                duration: const Duration(milliseconds: 70),
                child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 84,
                      ),
                      decoration:BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color(0xFFFFD700) ,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Continue as a Student",
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






            SizedBox(height: 15),
              GestureDetector(
                onTapDown: (_) => setState(() {
                  _padding = 0.0;
                }),
                onTapUp: (_) => setState(() {
                  _padding = 6.0;
                }) ,
                onTap: () {
                  Get.toNamed(MyRoutes.TeacherRoute);
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.only(bottom: _padding),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFD700),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  duration: const Duration(milliseconds: 70),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 84,
                    ),
                    decoration:BoxDecoration(
                       color:  Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Continue as a Teacher",
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
