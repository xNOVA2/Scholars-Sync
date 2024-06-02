import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/GettingStarted.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholars_sync/riverpods/register_teacher_pod.dart';
import 'dart:io';

import 'GetX.dart';
import 'GettingStartTeacher.dart';

class TeacherProfilePic extends ConsumerStatefulWidget {
  const TeacherProfilePic({super.key});

  @override
  ConsumerState createState() => _TeacherProfilePicState();
}

class _TeacherProfilePicState extends ConsumerState<TeacherProfilePic> {
  // Add a variable to hold the uploaded image
  Image? _uploadedImage;
  double _padding = 6.0;
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
              SizedBox(height: 20), // Added SizedBox for spacing
              Text(
                "Upload Your Picture",
                textAlign: TextAlign.left,
                style: GoogleFonts.nunito(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Please Enter Your Login Credentials",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  // Show dialog to select image or navigate to image preview screen
                  _showImagePickerDialog(ref);
                },
                child: Stack(
                  children: [
                    Container(
                      width: 300,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.black87, width: 2.0),
                      ),
                      child: _uploadedImage != null
                          ? CircleAvatar(
                        radius: 70,
                        backgroundImage: _uploadedImage!.image,
                      )
                          : Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 90,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: Icon(
                          Icons.add,
                          color: Color(0xFFFFD700),
                        ),
                      ),
                    ),
                    if (_uploadedImage != null)
                      Positioned(
                        bottom: 40,
                        right: 65,
                        child: GestureDetector(
                          onTap: () {
                            _removeImage();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 15,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 300),
              GestureDetector(
                onTapDown: (_) => setState(() {
                  _padding = 0.0;
                }),
                onTapUp: (_) => setState(() {
                  _padding = 6.0;
                }),
                onTap: () {
                  userController.setProfilePicture('path/to/profile/picture');
                  Get.to(GettingStartedTeacher());

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
                      "             Continue              ",
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
            ],
          ),
        ),
      ),
    );
  }

  // Function to show dialog for image picker
  void _showImagePickerDialog(WidgetRef ref) {
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
                    _getImage(ImageSource.gallery, ref);
                    Navigator.of(context).pop();
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    _getImage(ImageSource.camera, ref);
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

  // Function to pick image
  Future<void> _getImage(ImageSource source,WidgetRef ref) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      ref.read(registerPod).setProfileImage(pickedFile.path);
    }
    setState(() {
      if (pickedFile != null) {
        _uploadedImage = Image.file(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  // Function to remove the uploaded image
  void _removeImage() {
    setState(() {
      _uploadedImage = null;
    });
  }
}
