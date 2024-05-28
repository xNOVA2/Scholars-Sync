import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  double _padding = 6.0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: constraints.maxHeight * 0.014),
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            " Change Password",
                            style: GoogleFonts.nunito(
                              fontSize: constraints.maxWidth * 0.06,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              letterSpacing: -0.5,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.03),
                      buildPasswordField(
                        "  Current Password",
                        _currentPasswordController,
                        _isPasswordVisible,
                        constraints,
                        validateCurrentPassword,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      buildPasswordField(
                        "  New Password",
                        _newPasswordController,
                        _isPasswordVisible,
                        constraints,
                        validateNewPassword,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      buildPasswordField(
                        "  Confirm New Password",
                        _confirmNewPasswordController,
                        _isConfirmPasswordVisible,
                        constraints,
                        validateConfirmPassword,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.23),
                      buildChangePasswordButton(constraints),
                      SizedBox(height: constraints.maxHeight * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Current password is required';
    }
    return null;
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'New password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your new password';
    } else if (value != _newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Widget buildPasswordField(String labelText, TextEditingController controller, bool isPasswordVisible, BoxConstraints constraints, String? Function(String?) validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: constraints.maxWidth * 0.04,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Enter password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black54,
              ),
              onPressed: () {
                setState(() {
                  if (controller == _currentPasswordController || controller == _newPasswordController) {
                    _isPasswordVisible = !_isPasswordVisible;
                  } else {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  }
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
          validator: validator,
        ),
      ],
    );
  }

  Widget buildChangePasswordButton(BoxConstraints constraints) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        onTapDown: (_) => setState(() {
          _padding = 0.0;
        }),
        onTapUp: (_) => setState(() {
          _padding = 6.0;
        }),
        onTap: () {
          if (_formKey.currentState!.validate()) {
            // Perform password change operation
            // This is where you would make the API call to change the password
            // For demonstration, I'm just showing a snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Password changed successfully')),
            );
          }
        },
        child: AnimatedContainer(
          padding: EdgeInsets.only(bottom: _padding),
          decoration: BoxDecoration(
            color:Colors.black ,
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
              "   Change Password            ",
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
    );
  }
}
