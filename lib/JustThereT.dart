import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/routes.dart';

import 'FinishSetup.dart';

class JustThereTeacher extends StatefulWidget {
  @override
  _JustThereTeacherState createState() => _JustThereTeacherState();
}

class Subject {
  final String name;
  final String imagePath;

  Subject({required this.name, required this.imagePath});
}

class _JustThereTeacherState extends State<JustThereTeacher> {
  final TextEditingController _rollNumberController = TextEditingController();

  List<Subject> subjects = [
    Subject(name: 'Math', imagePath: 'assets/images/math.png'),
    Subject(name: 'English', imagePath: 'assets/images/English.png'),
    Subject(name: 'General Science', imagePath: 'assets/images/Science.png'),
    Subject(name: 'Islamiat', imagePath: 'assets/images/Islam.png'),
    Subject(name: 'Social Studies', imagePath: 'assets/images/SS.png'),
    Subject(name: 'Biology', imagePath: 'assets/images/Bio.png'),



    // Add more subjects as needed
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
              SizedBox(height: 10),
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
                        "   Choose your teaching details",
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
                  Expanded(
                    child: Text(
                      "      What's your teacher ID?",
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: 320, // Adjust the width as needed
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '12345',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 3.0), // Adjust the width
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2.0), // Adjust the width
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "      What subject do you teach?",
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
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black , width: 2.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ExpansionTile(
                    title: Text(
                      " Select Subject",
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    children: subjects.map((subject) {
                      return GestureDetector(
                        onTap: () {
                          // Handle subject selection
                          print("Selected subject: ${subject.name}");
                          // Navigate to other page
                          //Get.toNamed(MyRoutes.OtherPageRoute);
                        },
                        child: ListTile(
                          leading: Image.asset(
                            subject.imagePath,
                            width: 40, // Adjust the width of the image
                            height: 40, // Adjust the height of the image
                          ),
                          title: Text(subject.name),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              SizedBox(height: 300),
              Container(
                width: 330,
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
                      MaterialPageRoute(builder: (context) => FinishSetup()),
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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
