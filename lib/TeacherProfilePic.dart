import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/GettingStarted.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'GettingStartTeacher.dart';

class TeacherProfilePic extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<TeacherProfilePic> {
  // Add a variable to hold the uploaded image
  Image? _uploadedImage;

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align widgets to the left
            children: [
              Text(
                "Upload Your Picture",
                textAlign: TextAlign.left, // Align text to the left
                style: GoogleFonts.nunito(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Please Enter Your Login Credentials",
                textAlign: TextAlign.left, // Align text to the left
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  // Show dialog to select image or navigate to image preview screen
                  _showImagePickerDialog();
                },
                child: Stack(
                  children: [
                    Container(
                      width: 300,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.black87, width: 2.0), // Add missing comma
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
                        bottom:40,
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
              Container(
                width: 350,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Color(0xFFFFD700)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GettingStartedTeacher()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent), // Transparent background
                    elevation:
                    MaterialStateProperty.all<double>(0), // No elevation
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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

  // Function to pick image
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

  // Function to remove the uploaded image
  void _removeImage() {
    setState(() {
      _uploadedImage = null;
    });
  }
}
