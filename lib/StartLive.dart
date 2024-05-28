import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ResetPassword.dart';
import 'StudentPage.dart';

class StartLive extends StatefulWidget {
  @override
  _StartLiveState createState() => _StartLiveState();
}

class _StartLiveState extends State<StartLive> {
  double _padding = 6.0;
  TextEditingController controller = new TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> classList = [ "Class 2", "Class 3", "Class 4", "Class 5", "Class 6"];
  bool displayClassList = false;
  @override
  Widget build(BuildContext context) {
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "    Start Live Class ",
                            style: GoogleFonts.nunito(
                              fontSize: constraints.maxWidth * 0.06,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "      Class",
                                style: GoogleFonts.nunito(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            width: 320, // Increased width
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  width: 320, // Increased width
                                  height: 64, // Increased height
                                  padding: EdgeInsets.only(left: 16, right: 10 , top: 4), // Adjusted padding
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black, width: 2.0), // Border width 2.0
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextField(
                                    controller: controller,
                                    readOnly: true,
                                    textAlign: TextAlign.start, // Align text to the start
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
                                  margin: EdgeInsets.only(top: 5), // Adjusted margin
                                  height: 220, // Increased height
                                  width: 320, // Increased width
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
                                    child: SingleChildScrollView(// Enable scroll down only
                                      child: Column(
                                        children: [
                                          ListView.builder(
                                            itemCount: classList.length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(), // Disable scrolling of ListView
                                            padding: EdgeInsets.zero, // Remove padding
                                            itemBuilder: ((context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    controller.text = (index + 2).toString();
                                                    displayClassList = false; // Close dropdown
                                                  });
                                                },
                                                child: ListTile(title: Text(classList[index])),
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

                        SizedBox(height: 410),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "          Your meeting will be scheduled on ",
                                style: GoogleFonts.nunito(
                                  fontSize: constraints.maxWidth * 0.040,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(StudentForm());
                              },
                              child: Text(
                                "zoom",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'AvenirNext',
                                  fontWeight: FontWeight.w700,
                                  fontSize: constraints.maxWidth * 0.045,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTapDown: (_) => setState(() {
                              _padding = 0.0;
                            }),
                            onTapUp: (_) => setState(() {
                              _padding = 6.0;
                            }),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ResetPs()),
                              );
                            },
                            child: AnimatedContainer(
                              padding: EdgeInsets.only(bottom: _padding),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              duration: const Duration(milliseconds: 70),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 83,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Scheduled Zoom Session",
                                      style: GoogleFonts.nunito(
                                        fontSize: constraints.maxWidth * 0.042,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
