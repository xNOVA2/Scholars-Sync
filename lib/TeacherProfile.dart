import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholars_sync/FinalStep.dart';

import 'EditProfile.dart';
import 'EditTeacherProfile.dart';
import 'GetX.dart';
import 'StudentPage.dart';

class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  double _padding = 6.0;
  Image? _uploadedImage;
  final List<Map<String, String>> imageInfo = [
    {
      'path': 'assets/images/math.png',
      'title': 'Maths',
      'description': 'Sir Ahtisham Ali ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
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
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  GestureDetector(
                    onTap: () {
                      _showImagePickerDialog();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 128,
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
                          Stack(
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.3,
                                height: constraints.maxWidth * 0.25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black87, width: 2.0),
                                ),
                                child: _uploadedImage != null
                                    ? CircleAvatar(
                                  radius: constraints.maxWidth * 0.1,
                                  backgroundImage: _uploadedImage!.image,
                                )
                                    : Icon(
                                  Icons.person,
                                  size: constraints.maxWidth * 0.1,
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                top: constraints.maxWidth * 0.17,
                                right: constraints.maxWidth * 0.03,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: constraints.maxWidth * 0.04,
                                  child: Icon(
                                    Icons.add,
                                    size: constraints.maxWidth * 0.04,
                                    color: Color(0xFFFFD700),
                                  ),
                                ),
                              ),
                              if (_uploadedImage != null)
                                Positioned(
                                  bottom: constraints.maxWidth * 0.10,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      _removeImage();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: constraints.maxWidth * 0.03,
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: constraints.maxWidth * 0.02,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '   ${userController.userModel.value.name}',
                                style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 0),
                              Text(
                                '    ${userController.userModel.value.email}',
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Classes',
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
                          'Teacher ID',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${userController.userModel.value.id}',
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
                      itemCount: imageInfo.length,
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
                                        imageInfo[index]['path']!,
                                        width: 40,
                                        height: 40,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        imageInfo[index]['title']!,
                                        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        imageInfo[index]['description']!,
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
                        MaterialPageRoute(builder: (context) => EditTeacherProfile()),
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
          );
        },
      ),
    );
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    _getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _uploadedImage = Image.file(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  void _removeImage() {
    setState(() {
      _uploadedImage = null;
    });
  }
}
