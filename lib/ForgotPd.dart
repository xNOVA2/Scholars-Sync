import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/ResetPassword.dart';
import 'package:scholars_sync/StuDashboard.dart';
import 'package:scholars_sync/StudentPage.dart';
import 'package:scholars_sync/TeacherDashboard.dart';

import 'TeacherPage.dart';
import 'routes.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  double _padding = 6.0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();

  bool _validateOTPFields() {
    return isNumeric(controller1.text) &&
        isNumeric(controller2.text) &&
        isNumeric(controller3.text) &&
        isNumeric(controller4.text);
  }

  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01),
                Image.asset(
                  'assets/images/1.png',
                  width: width * 0.5,
                  height: height * 0.25,
                  fit: BoxFit.contain,
                ),
                Row(
                  children: [
                    Text(
                      "      Verification",
                      style: GoogleFonts.nunito(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Text(
                      "             Code has been sent to your account",
                      style: GoogleFonts.nunito(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildOTPTextField(controller1, focusNode1, focusNode2),
                      SizedBox(width: width * 0.033),
                      buildOTPTextField(controller2, focusNode2, focusNode3),
                      SizedBox(width: width * 0.033),
                      buildOTPTextField(controller3, focusNode3, focusNode4),
                      SizedBox(width: width * 0.033),
                      buildOTPTextField(controller4, focusNode4, null),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle resend code action
                      },
                      child: Text(
                        "Haven't received your code yet?",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: width * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                GestureDetector(
                  onTap: () {
                    // Handle resend code action
                  },
                  child: Text(
                    "Resend",
                    style: GoogleFonts.nunito(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTapDown: (_) => setState(() {
                    _padding = 0.0;
                  }),
                  onTapUp: (_) => setState(() {
                    _padding = 6.0;
                  }),
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPs()),
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
                        vertical: height * 0.02,
                        horizontal: width * 0.38,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Verify",
                        style: GoogleFonts.nunito(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOTPTextField(TextEditingController controller, FocusNode currentFocus, FocusNode? nextFocus) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.17,
      height: MediaQuery.of(context).size.height * 0.13,
      child: TextFormField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.07), // Adjust font size if needed
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide(color: Colors.black, width: 2.0), // Border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide(color: Colors.red), // Border color when focused
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide(color: Colors.black), // Border color when enabled
          ),
          counterText: '',
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus.unfocus();
            }
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          if (!isNumeric(value)) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}
