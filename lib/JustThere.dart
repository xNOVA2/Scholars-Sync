import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FinalStep.dart';
// Replace 'FinalStep.dart' with 'SubjectSelectionPage.dart'
import 'GetX.dart'; // Import your UserController

class JustThere extends StatefulWidget {
  @override
  _JustThereState createState() => _JustThereState();
}

class _JustThereState extends State<JustThere> {
  TextEditingController controller = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  double _padding = 6.0;
  final _formKey = GlobalKey<FormState>();

  List<String> classList = ["2", "3", "4", "5", "6"];
  bool displayClassList = false;

  final UserController userController = Get.find(); // Get the UserController instance

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        final screenHeight = MediaQuery.of(context).size.height;
        final screenWidth = MediaQuery.of(context).size.width;

        return Scaffold(
          backgroundColor: Color(0xFFFCFFD4),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.03),
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
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "   Just there",
                          style: GoogleFonts.nunito(
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.002),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "     Enter your class details",
                            style: GoogleFonts.nunito(
                              fontSize: width * 0.039,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "     Class",
                              style: GoogleFonts.nunito(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            width: width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: height * 0.01),
                                Container(
                                  width: width * 0.85,
                                  height: height * 0.07,
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black, width: 2.0),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextField(
                                    controller: controller,
                                    readOnly: true,
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      hintText: 'Select a Class',
                                      border: InputBorder.none,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            displayClassList = !displayClassList;
                                          });
                                        },
                                        child: Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                  ),
                                ),
                                displayClassList
                                    ? Container(
                                  margin: EdgeInsets.only(top: height * 0.01),
                                  height: height * 0.3,
                                  width: width * 0.8,
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
                                            itemCount: classList.length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            itemBuilder: ((context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    controller.text = classList[index];
                                                    displayClassList = false;
                                                  });
                                                  userController.setClass([classList[index]]); // Save selected class as a list
                                                },
                                                child: ListTile(
                                                  title: Text(classList[index]),
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
                        SizedBox(height: height * 0.02),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Container(
                            width: width * 0.85,
                            child: TextFormField(
                              controller: _rollNumberController,
                              style: TextStyle(color: Colors.black),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your roll number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter your roll number',
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
                  SizedBox(height: height * 0.43),
                  GestureDetector(
                    onTapDown: (_) => setState(() {
                      _padding = 0.0;
                    }),
                    onTapUp: (_) => setState(() {
                      _padding = 6.0;
                    }),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        userController.setRollNumber(_rollNumberController.text); // Save roll number
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Subject()), // Replace with correct page
                        );
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
                          horizontal: screenWidth * 0.3,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Color(0xFFFFD700),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "    Continue    ",
                          style: GoogleFonts.nunito(
                            fontSize: screenWidth * 0.046,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
