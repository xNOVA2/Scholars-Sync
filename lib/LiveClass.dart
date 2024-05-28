import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ResetPassword.dart';
import 'StudentPage.dart';

class LiveClass extends StatefulWidget {
  @override
  _LiveClassState createState() => _LiveClassState();
}

class _LiveClassState extends State<LiveClass> {
  TextEditingController controller = new TextEditingController();

  List<String> classList = ["2", "3", "4", "5" , "6"];
  bool displayClassList = false;
  double _padding = 6.0;

  TimeOfDay? selectedTime1;
  TimeOfDay? selectedTime2;

  String _selectedClass = '';
  final _formKey = GlobalKey<FormState>();

  List<String> _classes = ["2","3","4","5","6"];

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
                            "    Schedule Live Class ",
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
                                "       Class",
                                style: GoogleFonts.nunito(
                                  fontSize: constraints.maxWidth * 0.035,
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
                                  height: 7,
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

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Start Time           ",
                                      style: GoogleFonts.nunito(
                                        fontSize: constraints.maxWidth * 0.035,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1), // Adjust the height as needed
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
                            SizedBox(width: 40), // Adjust the width as needed
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "End Time              ",
                                      style: GoogleFonts.nunito(
                                        fontSize: constraints.maxWidth * 0.035,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1), // Adjust the height as needed
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
                        SizedBox(height: 320),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "       Your meeting will be scheduled on ",
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
                                  fontWeight: FontWeight.w700, // Or specify FontWeight.bold for bold text
                                  fontSize: constraints.maxWidth * 0.045,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                              MaterialPageRoute(builder: (context) => StudentForm()),
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
                                horizontal: 84,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "Scheduled Zoom Session",
                                style: GoogleFonts.nunito(
                                  fontSize: constraints.maxWidth * 0.040,
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
                ],
              ),
            ),
          );
        },
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
      width: 130, // Adjust the width as needed
      height: 60, // Adjust the height as needed
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
