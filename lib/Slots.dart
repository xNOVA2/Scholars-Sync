import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FinalStep.dart';
import 'ResetPassword.dart';
import 'StudentPage.dart';

class Slots extends StatefulWidget {
  @override
  _SlotsState createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
  final double appBarPadding = 20.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  double _padding = 6.0;
  final _formKey = GlobalKey<FormState>();


  TimeOfDay? selectedTime1;
  TimeOfDay? selectedTime2;

  String _selectedClass = '';

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
                            "     Add New Slot ",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Start Time              ",
                                style: GoogleFonts.nunito(
                                  fontSize: constraints.maxWidth * 0.039,
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
                                "End Time               ",
                                style: GoogleFonts.nunito(
                                  fontSize: constraints.maxWidth * 0.039,
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

                  SizedBox(height: 430),
                  GestureDetector(
                    onTapDown: (_) => setState(() {
                      _padding = 0.0;
                    }),
                    onTapUp: (_) => setState(() {
                      _padding = 6.0;
                    }),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Subject()),
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 143,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD700),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Add",
                          style: GoogleFonts.nunito(
                            fontSize: 16,
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
      width: 136, // Adjust the width as needed
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
