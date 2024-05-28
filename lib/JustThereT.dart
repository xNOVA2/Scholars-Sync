import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FinishSetup.dart';
import 'GetX.dart';
import 'user_controller.dart';

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
  double _padding = 6.0;
  Subject? selectedSubject;
  TextEditingController controller = new TextEditingController();
  final TextEditingController _teacherIDController = TextEditingController();
  final UserController userController = Get.find<UserController>(); // Get the UserController instance

  List<Subject> subjectNames = [
    Subject(name: 'Math', imagePath: 'assets/images/math.png'),
    Subject(name: 'English', imagePath: 'assets/images/English.png'),
    Subject(name: 'General Science', imagePath: 'assets/images/Science.png'),
    Subject(name: 'Islamiat', imagePath: 'assets/images/Islam.png'),
    Subject(name: 'Social Studies', imagePath: 'assets/images/SS.png'),
    Subject(name: 'Biology', imagePath: 'assets/images/Bio.png'),
  ];

  bool showSubjects = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Just there",
                  style: GoogleFonts.nunito(
                    fontSize: screenSize.width * 0.07,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose your teaching details",
                  style: GoogleFonts.nunito(
                    fontSize: screenSize.width * 0.035,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.04),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What's your teacher ID?",
                  style: GoogleFonts.nunito(
                    fontSize: screenSize.width * 0.035,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.9,
                child: TextFormField(
                  controller: _teacherIDController,
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
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What subject do you teach?",
                  style: GoogleFonts.nunito(
                    fontSize: screenSize.width * 0.035,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: screenSize.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenSize.height * 0.01),
                      Container(
                        width: screenSize.width * 0.9,
                        height: screenSize.height * 0.07,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.04),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: controller,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Select a Subject',
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showSubjects = !showSubjects;
                                });
                              },
                              child: Icon(Icons.arrow_drop_down),
                            ),
                          ),
                        ),
                      ),
                      showSubjects
                          ? Container(
                        margin:
                        EdgeInsets.only(top: screenSize.height * 0.01),
                        height: screenSize.height * 0.3,
                        width: screenSize.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListView.builder(
                                  itemCount: subjectNames.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: ((context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          controller.text =
                                              subjectNames[index].name;
                                          showSubjects = false;
                                        });
                                        userController.setSubject(
                                            subjectNames[index].name); // Save selected subject
                                      },
                                      child: ListTile(
                                        leading: Image.asset(
                                            subjectNames[index].imagePath,
                                            height: screenSize.width * 0.1,
                                            width: screenSize.width * 0.1),
                                        title: Text(
                                          subjectNames[index].name,
                                          style: TextStyle(
                                            fontSize:
                                            screenSize.width * 0.04,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.4),
              GestureDetector(
                onTapDown: (_) => setState(() {
                  _padding = 0.0;
                }),
                onTapUp: (_) => setState(() {
                  _padding = 6.0;
                }),
                onTap: () {
                  userController.setTeacherID(
                      _teacherIDController.text); // Save teacher ID
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinishSetup()),
                  );
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
                      "               Continue            ",
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
              SizedBox(height: screenSize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  // Initialize GetX dependencies
  Get.put(UserController());

  runApp(MaterialApp(
    home: JustThereTeacher(),
  ));
}
