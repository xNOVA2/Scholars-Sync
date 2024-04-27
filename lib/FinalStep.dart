import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/Home_page.dart';

class Subject extends StatefulWidget {
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;

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
                        "    Select your subject and teachers",
                        style: GoogleFonts.nunito(
                          fontSize: 14,
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected1 = !isSelected1;
                      });
                    },
                    child: Container(
                      width: 159,
                      height: 187,
                      decoration: BoxDecoration(
                        color: Colors.white, // Fill color with white
                        border: Border.all(
                          color: isSelected1 ? Colors.green : Colors.black,
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
                                top: 4, // Adjust the top position of the check icon
                                left: 4, // Adjust the left position of the check icon
                                child: Icon(
                                  Icons.check,
                                  size: 16, // Adjust the size of the check icon
                                  color: isSelected1 ? Colors.green : Colors.transparent,
                                ),
                              ),
                              Image.asset(
                                'assets/images/math.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Math', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sir Ahtisham Ali', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                      width: 159,
                      height: 187,
                      decoration: BoxDecoration(
                        color: Colors.white, // Fill color with white
                        border: Border.all(
                          color: isSelected2 ? Colors.green : Colors.black,
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
                                top: 4, // Adjust the top position of the check icon
                                left: 4, // Adjust the left position of the check icon
                                child: Icon(
                                  Icons.check,
                                  size: 16, // Adjust the size of the check icon
                                  color: isSelected2 ? Colors.green : Colors.transparent,
                                ),
                              ),
                              Image.asset(
                                'assets/images/English.png', // Replace with your image path
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'English', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Ms Mehrunisa', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
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
                      width: 159,
                      height: 187,
                      decoration: BoxDecoration(
                        color: Colors.white, // Fill color with white
                        border: Border.all(
                          color: isSelected3 ? Colors.green : Colors.black,
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
                                top: 4, // Adjust the top position of the check icon
                                left: 4, // Adjust the left position of the check icon
                                child: Icon(
                                  Icons.check,
                                  size: 16, // Adjust the size of the check icon
                                  color: isSelected3 ? Colors.green : Colors.transparent,
                                ),
                              ),
                              Image.asset(
                                'assets/images/Islam.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Islamiat', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Ms Shabana', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                      width: 159,
                      height: 187,
                      decoration: BoxDecoration(
                        color: Colors.white, // Fill color with white
                        border: Border.all(
                          color: isSelected4 ? Colors.green : Colors.black,
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
                                top: 4, // Adjust the top position of the check icon
                                left: 4, // Adjust the left position of the check icon
                                child: Icon(
                                  Icons.check,
                                  size: 16, // Adjust the size of the check icon
                                  color: isSelected4 ? Colors.green : Colors.transparent,
                                ),
                              ),
                              Image.asset(
                                'assets/images/SS.png', // Replace with your image path
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Social Studies', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sir Qasim', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
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
                      width: 159,
                      height: 187,
                      decoration: BoxDecoration(
                        color: Colors.white, // Fill color with white
                        border: Border.all(
                          color: isSelected5 ? Colors.green : Colors.black,
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
                                top: 4, // Adjust the top position of the check icon
                                left: 4, // Adjust the left position of the check icon
                                child: Icon(
                                  Icons.check,
                                  size: 16, // Adjust the size of the check icon
                                  color: isSelected5 ? Colors.green : Colors.transparent,
                                ),
                              ),
                              Image.asset(
                                'assets/images/Science.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'General Science',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'No name', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                      width: 159,
                      height: 187,
                      decoration: BoxDecoration(
                        color: Colors.white, // Fill color with white
                        border: Border.all(
                          color: isSelected6 ? Colors.green : Colors.black,
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
                                top: 4, // Adjust the top position of the check icon
                                left: 4, // Adjust the left position of the check icon
                                child: Icon(
                                  Icons.check,
                                  size: 16, // Adjust the size of the check icon
                                  color: isSelected6 ? Colors.green : Colors.transparent,
                                ),
                              ),
                              Image.asset(
                                'assets/images/Bio.png', // Replace with your image path
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Biology', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'No name ', // Your subject name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
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
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Transparent background
                    elevation: MaterialStateProperty.all<double>(0), // No elevation
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
