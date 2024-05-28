import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/GettingStarted.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholars_sync/TeacherDashboard.dart';
import 'dart:io';

import 'GettingStartTeacher.dart';

class EditTeacherProfile extends StatefulWidget {
  @override
  _EditTeacherProfileState createState() => _EditTeacherProfileState();
}

class _EditTeacherProfileState extends State<EditTeacherProfile> {
  Image? _uploadedImage;
  double _padding = 6.0;

  final TextEditingController _rollNumberController = TextEditingController();
  String _selectedClass = '';
  final _formKey = GlobalKey<FormState>();

  List<String> _classes = ["2", "3", "4", "5", "6", "7", "8", "9", "10"];

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;
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
              SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                "Edit Profile",
                textAlign: TextAlign.left,
                style: GoogleFonts.nunito(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 0),
              GestureDetector(
                onTap: () {
                  _showImagePickerDialog();
                },
                child: Stack(
                  children: [
                    Container(
                      width: screenSize.width * 0.35, // Adjusted width
                      height: screenSize.width * 0.4, // Adjusted height
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.black87, width: 2.0),
                      ),
                      child: _uploadedImage != null
                          ? CircleAvatar(
                        radius: screenSize.width * 0.2, // Adjusted radius
                        backgroundImage: _uploadedImage!.image,
                      )
                          : Icon(
                        Icons.person,
                        size: screenSize.width * 0.2, // Adjusted icon size
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      top: screenSize.width * 0.3, // Adjusted position
                      right: screenSize.width * 0.13, // Adjusted position
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: screenSize.width * 0.05, // Adjusted radius
                        child: Icon(
                          Icons.add,
                          color: Color(0xFFFFD700),
                        ),
                      ),
                    ),
                    if (_uploadedImage != null)
                      Positioned(
                        bottom: screenSize.width * 0.1, // Adjusted position
                        right: screenSize.width * 0.00, // Adjusted position
                        child: GestureDetector(
                          onTap: () {
                            _removeImage();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: screenSize.width * 0.03, // Adjusted radius
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: screenSize.width * 0.04, // Adjusted icon size
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Full Name",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Colors.black,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black , width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Email Address",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black , width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            " Class",
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: screenSize.width, // Adjusted width
                      constraints: BoxConstraints(maxWidth: 327),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: DropdownButtonFormField<String>(
                          value: _selectedClass.isNotEmpty ? _selectedClass : null,
                          onChanged: (value) {
                            setState(() {
                              _selectedClass = value!;
                            });
                          },
                          items: _classes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            hintText: '6',
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            border: InputBorder.none,
                          ),
                          icon: Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          elevation: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          selectedItemBuilder: (BuildContext context) {
                            return _classes.map<Widget>((String value) {
                              return Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                " Roll Number",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: screenSize.width, // Adjusted width
                        constraints: BoxConstraints(maxWidth: 327),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your roll number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Roll number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black, width: 3.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                    MaterialPageRoute(builder: (context) => TeacherDashboard()),
                  );
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.only(bottom: _padding),
                  decoration: BoxDecoration(
                    color:Colors.black ,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  duration: const Duration(milliseconds: 70),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.21,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFD700),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "               Save                   ",
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
            ],
          ),
        ),
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
