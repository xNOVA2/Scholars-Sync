import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GetX.dart';
import 'TeacherPage.dart';
import 'TeacherProfilePic.dart';

class CreateAccountTeacher extends StatefulWidget {
  @override
  _CreateAccountTeacherState createState() => _CreateAccountTeacherState();
}

class _CreateAccountTeacherState extends State<CreateAccountTeacher> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  late TextEditingController _passwordController;
  double _padding = 6.0;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  bool isChecked = false;

  void printMessage() {
    print("User Accepted");
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    print("Submitting form...");
    if (_formKey.currentState!.validate()) {
      print("Form is valid. Navigating...");
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created successfully')),
        );
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TeacherProfilePic()),
      );
    } else {
      print("Form validation failed.");
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
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!_containsSpecialCharacter(value)) {
      return 'Password must contain at least one special character';
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
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Create Your Account",
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  "Please enter your login credentials",
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.045,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Full Name",
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.045,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.black),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your full name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  onSaved: (value) => userController.setName(value!),

                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Email Address",
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.045,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: _validateEmail,
                  onSaved: (value) => userController.setEmail(value!),

                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Password",
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.045,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.black),
                  obscureText: !_isPasswordVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black54,
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
                  ),
                  validator: _validatePassword,
                  onSaved: (value) => userController.setPassword(value!),

                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Confirm Password",
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.045,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  obscureText: !_isConfirmPasswordVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Re-enter your password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                GestureDetector(
                  onTap: () {
                    isChecked ? printMessage : null;
                  },
                  child: Text(
                    "Accept our terms and conditions",
                    style: GoogleFonts.nunito(
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                GestureDetector(
                  onTapDown: (_) => setState(() {
                    _padding = 0.0;
                  }),
                  onTapUp: (_) => setState(() {
                    _padding = 6.0;
                  }),
                  onTap: () {
                    _submitForm();
                  },
                  child: AnimatedContainer(
                    padding: EdgeInsets.only(bottom: _padding),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFD700),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    duration: const Duration(milliseconds: 70),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth * 0.99,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.04,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Continue",
                            style: GoogleFonts.nunito(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(TeacherForm());
                      },
                      child: Text(
                        " Login",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
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

bool _containsSpecialCharacter(String value) {
  RegExp specialCharRegex = RegExp(r'[!@#%^&*(),.?":{}|<>]');
  return specialCharRegex.hasMatch(value);
}
