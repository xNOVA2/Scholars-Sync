import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'EmailVerify.dart';
import 'StuDashboard.dart';
import 'CreateAccount.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

void login(String email, String password, BuildContext context) async {
  var client = http.Client();
  try {
    var response = await client.post(
      Uri.parse('https://scholar-sync-be-r58o.vercel.app/api/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      print('Login Successful');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successful'),
          duration: Duration(seconds: 1),
        ),
      );
      // Navigate to the dashboard page after successful login
      Get.to(StudentDashboard());

    } else {
      print('Failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed login! Check email or password again'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error login!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class _StudentFormState extends State<StudentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  double _padding = 6.0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/1.png',
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.5,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: Text(
                        "Login to your Account",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Please enter your login credentials",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontSize: screenWidth * 0.04,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      "Email Address",
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.04,
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black87, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black87, width: 3.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black87, width: 2.0),
                        ),
                      ),
                      validator: _validateEmail,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Password",
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.04,
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
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
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
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
                      validator: _validatePassword,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EmailVerify()),
                            );
                          },
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.2),
                    GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          _padding = 0.0;
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          _padding = 6.0;
                        });
                      },
                      onTap: () {
                        // Perform form validation before login
                        if (_formKey.currentState!.validate()) {
                          login(emailController.text.toString(), passwordController.text.toString(), context);
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
                            color: Color(0xFFFFD700),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "    Login as a Student      ",
                            style: GoogleFonts.nunito(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Don't have an account?",
                            style: GoogleFonts.nunito(
                              fontSize: screenWidth * 0.039,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => CreateAccountPage());
                          },
                          child: Text(
                            " Create account!",
                            style: GoogleFonts.nunito(
                              color: Colors.deepPurple,
                              fontSize: screenWidth * 0.039,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email (e.g, @abc.com)';
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
}
