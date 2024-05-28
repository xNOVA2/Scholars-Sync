import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/StuDashboard.dart';
import 'package:scholars_sync/StudentPage.dart';
import 'package:scholars_sync/user_controller.dart';

import 'GetX.dart'; // Ensure this is the correct path

class Subject extends StatefulWidget {
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  double _padding = 6.0;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;

  final UserController userController = Get.find(); // Get the UserController instance

  List<String> selectedSubjects = [];

  void updateSubjectSelection(String subject, bool isSelected) {
    if (isSelected) {
      selectedSubjects.add(subject);
    } else {
      selectedSubjects.remove(subject);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "  Final Step",
                            style: GoogleFonts.nunito(
                              fontSize: constraints.maxWidth < 600 ? 24 : 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "   Select your subject and teachers",
                            style: GoogleFonts.nunito(
                              fontSize: constraints.maxWidth < 600 ? 16 : 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSubjectCard(
                        constraints,
                        isSelected1,
                        'assets/images/math.png',
                        'maths',
                        'Sir Ahtisham Ali',
                        onTap: () {
                          setState(() {
                            isSelected1 = !isSelected1;
                            updateSubjectSelection('Math', isSelected1);
                          });
                        },
                      ),
                      buildSubjectCard(
                        constraints,
                        isSelected2,
                        'assets/images/English.png',
                        'english',
                        'Ms Mehrunisa',
                        onTap: () {
                          setState(() {
                            isSelected2 = !isSelected2;
                            updateSubjectSelection('English', isSelected2);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSubjectCard(
                        constraints,
                        isSelected3,
                        'assets/images/Islam.png',
                        'Islamiat',
                        'Ms Shabana',
                        onTap: () {
                          setState(() {
                            isSelected3 = !isSelected3;
                            updateSubjectSelection('Islamiat', isSelected3);
                          });
                        },
                      ),
                      buildSubjectCard(
                        constraints,
                        isSelected4,
                        'assets/images/SS.png',
                        'Social Studies',
                        'Sir Qasim',
                        onTap: () {
                          setState(() {
                            isSelected4 = !isSelected4;
                            updateSubjectSelection('Social Studies', isSelected4);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSubjectCard(
                        constraints,
                        isSelected5,
                        'assets/images/Science.png',
                        'General Science',
                        'No name',
                        onTap: () {
                          setState(() {
                            isSelected5 = !isSelected5;
                            updateSubjectSelection('General Science', isSelected5);
                          });
                        },
                      ),
                      buildSubjectCard(
                        constraints,
                        isSelected6,
                        'assets/images/Bio.png',
                        'Biology',
                        'No name',
                        onTap: () {
                          setState(() {
                            isSelected6 = !isSelected6;
                            updateSubjectSelection('Biology', isSelected6);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTapDown: (_) => setState(() {
          _padding = 0.0;
        }),
        onTapUp: (_) => setState(() {
          _padding = 6.0;
        }),
        onTap: () {
          userController.setSubjects(selectedSubjects); // Save selected subjects
          userController.Register().then((_) {
            Get.snackbar('Success', 'Account created successfully');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentForm()),
            );
          }).catchError((error) {
            Get.snackbar('Error', 'Failed to create account');
          });
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
              "                 Finish                 ",
              style: GoogleFonts.nunito(
                fontSize: screenWidth * 0.046,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                letterSpacing: -0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubjectCard(BoxConstraints constraints, bool isSelected, String imagePath, String subjectName, String teacherName, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: constraints.maxWidth < 600 ? 150 : 200,
        height: constraints.maxWidth < 600 ? 185 : 220,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.green : Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 4,
                  left: 4,
                  child: Icon(
                    Icons.check,
                    size: 16,
                    color: isSelected ? Colors.green : Colors.transparent,
                  ),
                ),
                Image.asset(
                  imagePath,
                  width: constraints.maxWidth < 600 ? 100 : 120,
                  height: constraints.maxWidth < 600 ? 100 : 120,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              subjectName,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              teacherName,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Subject(),
  ));
}
