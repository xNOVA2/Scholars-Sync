import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ResetPassword.dart';
import 'StudentPage.dart';
import 'MathsFaculty.dart';  // Add import statements for other faculty pages
import 'EnglishFaculty.dart';
import 'IslamicStudiesFaculty.dart';
import 'BiologyFaculty.dart';
import 'ScienceFaculty.dart';
import 'SocialStudiesFaculty.dart';

class Session extends StatefulWidget {
  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<Session> {
  double _padding = 6.0;
  bool _isTapped = false;
  final List<Map<String, String>> imageInfo = [
    {
      'path': 'assets/images/math.png',
      'title': 'Maths',
      'description': 'Sir Ahtisham Ali',
    },
    {
      'path': 'assets/images/English.png',
      'title': 'English',
      'description': 'Ms. Mehrunisa',
    },
    {
      'path': 'assets/images/Islam.png',
      'title': 'Islamic Studies',
      'description': 'Ms. Shabana',
    },
    {
      'path': 'assets/images/Bio.png',
      'title': 'Biology',
      'description': 'No name',
    },
    {
      'path': 'assets/images/Science.png',
      'title': 'Science',
      'description': 'No name',
    },
    {
      'path': 'assets/images/SS.png',
      'title': 'Social Studies',
      'description': 'Sir Qasim',
    },
  ];

  int? selectedSubjectIndex;
  TimeOfDay? selectedTime1;
  TimeOfDay? selectedTime2;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFFD4),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  Book a session",
                  style: GoogleFonts.nunito(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "    Select a Choose Subject",
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 129,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageInfo.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSubjectIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        width: 120,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedSubjectIndex == index ? Colors.green : Colors.black,
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
                            if (selectedSubjectIndex == index)
                              Positioned(
                                top: 3,
                                right: 90,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Start Time              ",
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      TimeSelectorContainer(
                        selectedTime: selectedTime1,
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              selectedTime1 = pickedTime;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "End Time                ",
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      TimeSelectorContainer(
                        selectedTime: selectedTime2,
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              selectedTime2 = pickedTime;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 200),
              Row(
                children: [
                  Text(
                    "    Your meeting will be scheduled on ",
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(StudentForm());
                    },
                    child: Text(
                      "meet",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTapDown: (_) => setState(() {
                  _padding = 0.0;
                }),
                onTapUp: (_) => setState(() {
                  _padding = 6.0;
                }),
                onTap: () {
                  if (selectedTime1 == null || selectedTime2 == null) {
                    // Display a snackbar or alert indicating that both start and end times must be selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select both start and end times.'),
                      ),
                    );
                  } else {
                    // Convert TimeOfDay to DateTime
                    DateTime startTime = DateTime(0, 1, 1, selectedTime1!.hour, selectedTime1!.minute);
                    DateTime endTime = DateTime(0, 1, 1, selectedTime2!.hour, selectedTime2!.minute);

                    if (startTime.isAfter(endTime)) {
                      // Display a snackbar or alert indicating that start time cannot be after end time
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Start time cannot be after end time.'),
                        ),
                      );
                    } else {
                      // Continue with the navigation or other actions
                      if (selectedSubjectIndex == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select a subject.'),
                          ),
                        );
                      } else {
                        switch (selectedSubjectIndex) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MathsFaculty()),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EnglishFaculty()),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => IslamicStudiesFaculty()),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BiologyFaculty()),
                            );
                            break;
                          case 4:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ScienceFaculty()),
                            );
                            break;
                          case 5:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SocialStudiesFaculty()),
                            );
                            break;
                        }
                      }
                    }
                  }
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
                      color: Colors.blue,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Schedule Meet Session ",
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
}

class TimeSelectorContainer extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final VoidCallback onPressed;

  const TimeSelectorContainer({
    Key? key,
    required this.selectedTime,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          selectedTime != null ? '${selectedTime!.hour}:${selectedTime!.minute}' : '00:00',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
