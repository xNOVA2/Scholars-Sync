import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/StuDashboard.dart';
import 'package:scholars_sync/StudentPage.dart';
import 'package:scholars_sync/TeacherDashboard.dart';
import 'package:scholars_sync/riverpods/register_teacher_pod.dart';

import 'GetX.dart';
import 'TeacherPage.dart';
import 'routes.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  double _padding = 6.0;
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final register = ref.watch(registerPod);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFFFCFFD4),
        appBar: null,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.01),
                    Image.asset(
                      'assets/images/1.png',
                      width: constraints.maxWidth * 0.5,
                      height: constraints.maxWidth * 0.5,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Image.asset(
                      'assets/images/children.png',
                      width: constraints.maxWidth * 0.7,
                      height: constraints.maxWidth * 0.7,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Welcome to Scholar's Sync",
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      "Unlock Your Potential, One Lesson at a Time.",
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    GestureDetector(
                      onTapDown: (_) => setState(() {
                        _padding = 0.0;
                      }),
                      onTapUp: (_) => setState(() {
                        _padding = 6.0;
                      }),
                      onTap: () {
                        userController.setRole("student");
                        register.role = "student";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StudentForm()),
                        );
                      },
                      child: AnimatedContainer(
                        padding: EdgeInsets.only(bottom: _padding),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        duration: const Duration(milliseconds: 70),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.21,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Color(0xFFFFD700),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Continue as a Student",
                            style: GoogleFonts.nunito(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GestureDetector(
                      onTapDown: (_) => setState(() {
                        _padding = 0.0;
                      }),
                      onTapUp: (_) => setState(() {
                        _padding = 6.0;
                      }),
                      onTap: () {
                        userController.setRole("teacher");
                        register.role="teacher";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeacherForm()),
                        );
                      },
                      child: AnimatedContainer(
                        padding: EdgeInsets.only(bottom: _padding),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD700),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        duration: const Duration(milliseconds: 70),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.21,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Continue as a Teacher",
                            style: GoogleFonts.nunito(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit'),
        content: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}
