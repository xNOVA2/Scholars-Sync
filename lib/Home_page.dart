import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(MyRoutes.StudentRoute);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color(0xFFFFD700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  elevation: 0, // Removed shadow effect
                  padding: EdgeInsets.all(10), // Added padding
                ),
                child: SizedBox(
                  width: 279,
                  height: 30,
                  child: Center(
                    child: Text(
                      'Continue as a Student',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                          letterSpacing: -0.5
                      ),
                    ),
                  ),
                ),
              ),




              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.toNamed(MyRoutes.TeacherRoute);
                },
                child: Container(
                  width: 300,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Color(0xFFFFD700)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue as a Teacher',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white, letterSpacing: -0.5
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
