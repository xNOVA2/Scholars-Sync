import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/Home_page.dart';
import 'package:scholars_sync/TeacherDashboard.dart';
import 'package:scholars_sync/routes.dart';
import 'GetX.dart';
import 'JustThereT.dart';
import 'TeacherPage.dart';
import 'package:http/http.dart' as http;

class FinishSetup extends StatefulWidget {
  @override
  _FinishState createState() => _FinishState();
}

class _FinishState extends State<FinishSetup> {
  double _padding = 6.0;

  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;

  List<String> getSelectedClasses() {
    List<String> selectedClasses = [];
    if (isSelected1) selectedClasses.add('Class 1');
    if (isSelected2) selectedClasses.add('Class 2');
    if (isSelected3) selectedClasses.add('Class 3');
    if (isSelected4) selectedClasses.add('Class 4');
    if (isSelected5) selectedClasses.add('Class 5');
    if (isSelected6) selectedClasses.add('Class 6');
    return selectedClasses;
  }
  final UserController userController = Get.find(); // Get the UserController instance


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFFD4),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "  Finishing Up",
                        style: GoogleFonts.nunito(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "    Choose classes that you teach",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '    Classes',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected1 = !isSelected1;
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.4,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: isSelected1 ? Colors.black : Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 22,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected1 ? Colors.black : Colors.transparent,
                                border: Border.all(
                                  color: isSelected1 ? Colors.black : Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: isSelected1
                                  ? Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.white,
                              )
                                  : Icon(
                                Icons.check_box_outline_blank,
                                size: 18,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'Class 1',
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected2 = !isSelected2;
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.4,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: isSelected2 ? Colors.black : Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 22,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected2 ? Colors.black : Colors.transparent,
                                border: Border.all(
                                  color: isSelected2 ? Colors.black : Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: isSelected2
                                  ? Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.white,
                              )
                                  : Icon(
                                Icons.check_box_outline_blank,
                                size: 18,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'Class 2',
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected3 = !isSelected3;
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.4,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: isSelected3 ? Colors.black : Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 22,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected3 ? Colors.black : Colors.transparent,
                                border: Border.all(
                                  color: isSelected3 ? Colors.black : Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: isSelected3
                                  ? Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.white,
                              )
                                  : Icon(
                                Icons.check_box_outline_blank,
                                size: 18,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'Class 3',
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected4 = !isSelected4;
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.4,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: isSelected4 ? Colors.black : Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 22,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected4 ? Colors.black : Colors.transparent,
                                border: Border.all(
                                  color: isSelected4 ? Colors.black : Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: isSelected4
                                  ? Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.white,
                              )
                                  : Icon(
                                Icons.check_box_outline_blank,
                                size: 18,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'Class 4',
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected5 = !isSelected5;
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.4,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: isSelected5 ? Colors.black : Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 22,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected5 ? Colors.black : Colors.transparent,
                                border: Border.all(
                                  color: isSelected5 ? Colors.black : Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: isSelected1
                                  ? Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.white,
                              )
                                  : Icon(
                                Icons.check_box_outline_blank,
                                size: 18,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'Class 5',
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected6 = !isSelected6;
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.4,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: isSelected6 ? Colors.black : Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 22,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected6 ? Colors.black : Colors.transparent,
                                border: Border.all(
                                  color: isSelected6 ? Colors.black : Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: isSelected6
                                  ? Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.white,
                              )
                                  : Icon(
                                Icons.check_box_outline_blank,
                                size: 18,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'Class 6',
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),


              SizedBox(height: 240),
              GestureDetector(
                onTapDown: (_) => setState(() {
                  _padding = 0.0;
                }),
                onTapUp: (_) => setState(() {
                  _padding = 6.0;
                }),
                onTap: () {
                  List<String> selectedClasses = getSelectedClasses();
                  userController.setClass(selectedClasses);
                  userController.Register().then((_) {
                    Get.snackbar('Success', 'Account created successfully');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeacherForm()),
                    );
                  }).catchError((error) {
                    Get.snackbar('Error', 'Failed to create account');
                  });
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.only(bottom: _padding),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFD700),
                      borderRadius: BorderRadius.circular(15)),
                  duration: const Duration(milliseconds: 70),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 84,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "              Finish             ",
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

            ],
          ),
        ),
      ),
    );
  }
}

