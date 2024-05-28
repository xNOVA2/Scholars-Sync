import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/FinalStep.dart';

import 'EditProfile.dart';
import 'GetX.dart';
import 'StudentPage.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  double _padding = 6.0;
  final List<Map<String, String>> imageInfo = [
    {
      'path': 'assets/images/math.png',
      'title': 'Math',
      'description': 'Sir Ahtisham Ali',
    },
    {
      'path': 'assets/images/English.png',
      'title': 'English',
      'description': 'Ms. Mehrunisa',
    },
    {
      'path': 'assets/images/Islam.png',
      'title': 'Islamiat',
      'description': 'Ms. Shabana',
    },
    {
      'path': 'assets/images/Bio.png',
      'title': 'Biology',
      'description': 'No name',
    },
    {
      'path': 'assets/images/Science.png',
      'title': 'General Science',
      'description': 'No name',
    },
    {
      'path': 'assets/images/SS.png',
      'title': 'Social Studies',
      'description': 'Sir Qasim',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    final List<String>? selectedSubjects = userController.userModel.value.subjects;
    final List<Map<String, String>> filteredImageInfo = imageInfo.where((subject) {
      return selectedSubjects != null && selectedSubjects.contains(subject['title']);
    }).toList();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: Color(0xFFFCFFD4),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StudentForm()),
                          );
                        },
                        child: Text(
                          "Logout?",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Profile",
                          style: GoogleFonts.nunito(
                            fontSize: constraints.maxWidth < 600 ? 24 : 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Container(
                    width: constraints.maxWidth < 600 ? double.infinity : 335,
                    height: 131,
                    decoration: BoxDecoration(
                      color: Color(0xFFE3E7B7),
                      border: Border.all(
                        color: Color(0xFFE3E7B7),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/profile.png',
                                width: 109,
                                height: 117,
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    userController.userModel.value.profilePicture ?? 'assets/images/profile.png',
                                  ),
                                  radius: 20, // Half of the 109 width minus some padding
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${userController.userModel.value.name}',
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${userController.userModel.value.email}',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 30),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Class',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${userController.userModel.value.classNo}',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Roll Number',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${userController.userModel.value.rollNumber}',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'School',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${userController.userModel.value.school}',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Subjects',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Handle subject change
                          },
                          child: Text(
                            "Change?",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Colors.purple,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredImageInfo.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            width: 130,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        filteredImageInfo[index]['path']!,
                                        width: 40,
                                        height: 40,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        filteredImageInfo[index]['title']!,
                                        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        filteredImageInfo[index]['description']!,
                                        style: GoogleFonts.nunito(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 60),
                  GestureDetector(
                    onTapDown: (_) => setState(() {
                      _padding = 0.0;
                    }),
                    onTapUp: (_) => setState(() {
                      _padding = 6.0;
                    }),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 120,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD700),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Edit Profile",
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
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
