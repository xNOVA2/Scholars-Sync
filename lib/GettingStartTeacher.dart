import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/routes.dart';

class GettingStartedTeacher extends StatefulWidget {
  @override
  _GettingStartedTeacherState createState() => _GettingStartedTeacherState();
}

class _GettingStartedTeacherState extends State<GettingStartedTeacher> {
  // List of schools
  List<String> _schools = [
    "School A",
    "School B",
    "School C",
    // Add more schools as needed
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
          padding: const EdgeInsets.all(0),
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
                        "  Getting Started",
                        style: GoogleFonts.nunito(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5                        ),
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
                        "    Select your school",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  maxWidth: 310,
                  maxHeight: 50,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "    Search School",
                    contentPadding: EdgeInsets.only(bottom: 8), // Adjusting position of the hint text
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        // Customizing border thickness
                        width: 2.0,
                      ),
                    ),
                    // Customizing border color when focused
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Colors.blue, // Example color
                        width: 2.0,
                      ),
                    ),
                    // Customizing border color when enabled but not focused
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Colors.black, // Example color
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 35),
              GestureDetector(
                onTap: () {
                  // Handle onTap
                  Get.toNamed(MyRoutes.JustThereTeacherRoute);
                },
                child: Container(
                  width: 310,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0, // Customizing border thickness
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        'Beaconhouse School System',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              Container(
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black, width: 2.0), // Adding borders
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/images/dots.png', // Path to your image asset
                          width: 45, // Adjust size as needed
                          height: 45, // Adjust size as needed
                        ),
                        SizedBox(width: 8), // Add space between image and text
                        Text(
                          "Other School",
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    children: _schools.map((school) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(MyRoutes.JustThereTeacherRoute);
                        },
                        child: ListTile(
                          title: Text(school),
                        ),
                      );
                    }).toList(),
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
