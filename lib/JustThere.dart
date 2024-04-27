import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/FinishSetup.dart';
import 'package:scholars_sync/routes.dart';

import 'FinalStep.dart';

class JustThere extends StatefulWidget {
  @override
  _JustThereState createState() => _JustThereState();
}

class _JustThereState extends State<JustThere> {
  final TextEditingController _rollNumberController = TextEditingController();
  // List of classes
  List<String> _classes = [
    "7",
    "8",
    "9",
    "10",
    // Add more classes as needed
  ];

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
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "  Just there",
                        style: GoogleFonts.nunito(
                          fontSize: 25,
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
                        "    Enter your class details",
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded( // Use Expanded to occupy remaining space
                    child: Text(
                      "       Class",
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
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black ,  width: 2.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ExpansionTile(
                    title: Text(
                      "6",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    children: _classes.map((school) {
                      return GestureDetector(
                        onTap: () {
                          // Handle school selection
                          print("Selected class: $school");
                          // Navigate to other page
                          // Get.toNamed(MyRoutes.OtherPageRoute);
                        },
                        child: ListTile(
                          title: Text(school),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "         Roll Number",
                    style: GoogleFonts.nunito(

                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  // Add any other widgets you may need
                ],
              ),
              Container(
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black , width: 2.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: _rollNumberController,
                  decoration: InputDecoration(
                    hintText: 'Enter your roll number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(height: 300),
              Container(
                width: 330,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFFFFD700),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Subject()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                    // Transparent background
                    elevation: MaterialStateProperty.all<double>(0),
                    // No elevation
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
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Add space after the button
            ],
          ),
        ),
      ),
    );
  }
}
