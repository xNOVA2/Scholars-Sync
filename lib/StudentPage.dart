import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/CreateAccount.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholars_sync/StuDashboard.dart';

class StudentForm extends StatefulWidget {

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  Future<void> _submitForm() async {
    // Check if both email and password fields are empty
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    // Validate the form
    if (_formKey.currentState!.validate()) {
      // Proceed with login if form validation passes
      login(emailController.text.toString(), passwordController.text.toString());
    } else {
      // Form is invalid, show error messages
      if (_validateEmail(emailController.text.toString()) != null) {
        // If the email is invalid, show "invalid email" message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid email')),
        );
      }
      // You can remove the password validation message here
    }
  }


  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    if (!value.endsWith('.com')) {
      return 'Please enter a valid email ';
    }
    return null;
  }


  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }

    return null;
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      hintText: label,
      prefixIcon: Icon(icon),
      suffixIcon: label == 'Password'
          ? IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      // Make the API request
      http.Response response = await post(
        Uri.parse('https://average-bandanna-pig.cyclic.app/api/auth/login' ),
        body: {
          'email': email,
          'password': password
        },
      );

      // Check the status code of the response
      if (response.statusCode == 400) {
        // Login successful
        print('Login successful');

        // Navigate to another page
        Get.to(StudentDashboard());
      } else {
        // Login failed, print out the status code and response body
        print('Login failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        // Show a snackbar indicating login failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      // An error occurred while making the request
      print('Error occurred during login: $e');

      // Show a snackbar indicating error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }




  double _padding = 6.0;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/1.png',
                      height: 120,
                      width: 300,
                    ),
                  ],
                ),
                Text(
                  "Login to your Account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Please enter your login credentials",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 30.0),
                Text(
                  "Email Address",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true, // Set to true to fill the background
                    fillColor: Colors.white, // Set the background color
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black87, width: 2.0), // Adjust the width
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black87, width: 3.0), // Adjust the width
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black87, width: 2.0), // Adjust the width
                    ),
                  ),
                  validator: _validateEmail,
                ),


                SizedBox(height: 16.0),
                Text(
                  "Password",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: !_isPasswordVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true, // Set to true to fill the background
                    fillColor: Colors.white, // Set the background color
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2.0), // Set the border color and width
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
                  validator: _validatePassword,
                ),


                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle forgot password action
                      },
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 120.0),
                GestureDetector(
                  onTapDown: (_) => setState(() {
                    _padding = 0.0;
                  }),
                  onTapUp: (_) => setState(() {
                    _padding = 6.0;
                  }) ,
                  onTap: () {
                    // Call _submitForm() to trigger form validation
                    _submitForm();
                    // Check if the form is valid before attempting login
                    if (_formKey.currentState!.validate()) {
                      // Proceed with login if form validation passes
                      login(emailController.text.toString(), passwordController.text.toString());
                    }
                  },


                  child: AnimatedContainer(
                    padding: EdgeInsets.only(bottom: _padding),
                    decoration: BoxDecoration(
                        color: Colors.black ,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    duration: const Duration(milliseconds: 70),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 110,
                      ),
                      decoration:BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color(0xFFFFD700),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Login as a Student",
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

                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "                 Don't have account?",
                        style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(CreateAccountPage());
                      },
                      child: Text(
                        " Create account!",
                        style: GoogleFonts.nunito(color: Colors.deepPurple, letterSpacing: -0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}