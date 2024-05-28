import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/Home_page.dart';
import 'package:scholars_sync/LiveClass.dart';
import 'package:scholars_sync/QuizPage.dart';
import 'package:scholars_sync/routes.dart';

import 'Availability.dart';
import 'BookSession.dart';
import 'ChangePassword.dart';
import 'GetX.dart';
import 'Leaderboard.dart';
import 'MyProfile.dart';
import 'Rewards.dart';
import 'SessionsList.dart';
import 'StartLive.dart';
import 'TeacherProfile.dart';

class TeacherDashboard extends StatefulWidget {
  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  double _padding = 6.0;

  final double appBarPadding = 20.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> imageInfo = [
    {
      'path': 'assets/images/math.png',
      'title': 'Mathematics',
      'description': '50 Points',
    },
    {
      'path': 'assets/images/English.png',
      'title': 'English',
      'description': '50 Points',
    },
    {
      'path': 'assets/images/Islam.png',
      'title': 'Islamic Studies',
      'description': '50 Points',
    },
    {
      'path': 'assets/images/Bio.png',
      'title': 'Biology',
      'description': '50 Points',
    },
    {
      'path': 'assets/images/Science.png',
      'title': 'Science',
      'description': '50 Points',
    },
    {
      'path': 'assets/images/SS.png',
      'title': 'Social Studies',
      'description': '50 Points',
    },
  ];

  int? tappedIndex; // To keep track of tapped image index
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFFCFFD4),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Align items to the start and end
            children: [
              // Widget to position the first image exactly in the middle
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/1.png',
                      width: 150,
                      height: 70,
                    ),
                  ],
                ),
              ),
              // Widget to position the alarm image in the corner with the notification icon
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to the desired screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Leaderboard()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/podium.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 0),
                  // Add space between alarm and notification icon
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.black),
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: appBarPadding),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '    Welcome,',
                  style: GoogleFonts.nunito(
                    fontSize: 18, fontWeight: FontWeight.w700,),
                ),
              ),
              SizedBox(height: 0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '   Ali Mujtaba!',
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigate to the desired screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StartLive()),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 162,
                                height: 143,
                                decoration: BoxDecoration(
                                  color: Color(0xFF7A1909),
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Image.asset(
                                  'assets/images/signal.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 15,
                                child: Text(
                                  "Start ",
                                  style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                left: 15,
                                child: Text(
                                  "Live Class Now ",
                                  style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the desired screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LiveClass()),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 162,
                                height: 143,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFD700),
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Image.asset(
                                  'assets/images/school.png', // Replace 'your_image.png' with your image asset path
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 15,
                                child: Text(
                                  "Schedule " , style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                left: 15,
                                child: Text(
                                  "Live Class " , style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 330,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Add onTap action for the container
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveClass()),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image.asset(
                            'assets/images/Frame.png',
                            // Replace 'example.png' with your image asset path
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(height: 3),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ' Upcoming 1 on 1 session',
                                  style: GoogleFonts.nunito(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ],
                            ),

                            Text(
                              ' 00:00 - 00:00 . Subject',
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 330,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Add onTap action for the container
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Leaderboard()),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image.asset(
                            'assets/images/pod.png',
                            // Replace 'example.png' with your image asset path
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(height: 3),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ' Leaderboard',
                                  style: GoogleFonts.nunito(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            ),

                            Text(
                              ' 30 Students',
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Add onTap action for the container
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SessionsRequest()),
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "               You have _ New Session Requests" ,
                      style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5E2A88),
                    ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                          color: Color(0xFF5E2A88),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 4),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '     Upcoming Live Classes',
                    style: GoogleFonts.nunito(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3),
              GestureDetector(
                onTap: () {
                  // Handle onTap
                  Get.toNamed(MyRoutes.JustThereRoute);
                },
                child: Center(
                  child: Container(
                    width: 330,
                    height: 73,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0, // Customizing border thickness
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Frame.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Adjust spacing between image and text
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Data',
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Adjust spacing between lines
                              Text(
                                '00:00 - 00:00',
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/math.png',
                                // Add your image asset path here
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  // Handle onTap
                  Get.toNamed(MyRoutes.JustThereRoute);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 330,
                      height: 73,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0, // Customizing border thickness
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/Frame.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Adjust spacing between image and text
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Data',
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                // Adjust spacing between lines
                                Text(
                                  '00:00 - 00:00',
                                  style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/math.png',
                                  // Add your image asset path here
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Handle onTap
                  Get.toNamed(MyRoutes.JustThereRoute);
                },
                child: Center(
                  child: Container(
                    width: 330,
                    height: 73,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0, // Customizing border thickness
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Frame.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Adjust spacing between image and text
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Data',
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Adjust spacing between lines
                              Text(
                                '00:00 - 00:00',
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/math.png',
                                // Add your image asset path here
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 500),
            ],
          ),
        ),
        drawer: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), // Adjust the radius for top right corner
            bottomRight: Radius.circular(40), // Adjust the radius for bottom right corner
          ),
          child: Drawer(

            child: Container(

              color: Color(0xFFFCFFD4),

              child: ListView(
                padding: EdgeInsets.zero,

                children: [
                  AppBar(
                    automaticallyImplyLeading: false, // Remove the default leading icon
                    elevation: 0, // Remove the shadow
                    backgroundColor: Colors.transparent, // Set background color to transparent
                    title: Text(''), // Empty title to center the exit icon
                    actions: [
                      IconButton(
                        icon: Icon(Icons.highlight_off), // Use the close icon for exiting
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the drawer
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      SizedBox(width: 10), // Adjust spacing between image and column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' ${userController.userModel.value.name}',
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ' Kings League',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10), // Adjust spacing between text and button
                          GestureDetector(
                            onTapDown: (_) => setState(() {
                              _padding = 0.0;
                            }),
                            onTapUp: (_) => setState(() {
                              _padding = 4.0;
                            }),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TeacherProfile()),
                              );
                            },
                            child: AnimatedContainer(
                              padding: EdgeInsets.only(bottom: _padding),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12)),
                              duration: const Duration(milliseconds: 70),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 19,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFD700),
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  " View Profile",
                                  style: GoogleFonts.nunito(
                                    fontSize: 12,
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
                    ],
                  ),

                  SizedBox(height: 0),

                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/images/home.png', // Replace 'assets/images/home.png' with the path to your image
                          width: 30, // Adjust width as needed
                          height: 30, // Adjust height as needed
                        ),
                        SizedBox(width: 4), // Adjust spacing between image and text
                        Text(
                          'Home',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/images/quiz.png', // Replace 'assets/images/home.png' with the path to your image
                          width: 30, // Adjust width as needed
                          height: 30, // Adjust height as needed
                        ),
                        SizedBox(width: 4), // Adjust spacing between image and text
                        Text(
                          'My Quizes',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );                },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/images/badge.png', // Replace 'assets/images/home.png' with the path to your image
                          width: 30, // Adjust width as needed
                          height: 30, // Adjust height as needed
                        ),
                        SizedBox(width: 4), // Adjust spacing between image and text
                        Text(
                          'Leaderboard',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Rewards()),
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/images/timer.png', // Replace 'assets/images/home.png' with the path to your image
                          width: 30, // Adjust width as needed
                          height: 30, // Adjust height as needed
                        ),
                        SizedBox(width: 4), // Adjust spacing between image and text
                        Text(
                          'My Availability',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Availability()),
                      );                },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/images/lock.png', // Replace 'assets/images/home.png' with the path to your image
                          width: 30, // Adjust width as needed
                          height: 30, // Adjust height as needed
                        ),
                        SizedBox(width: 4), // Adjust spacing between image and text
                        Text(
                          'Change Password',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePassword()),
                      );                },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/images/logout.png', // Replace 'assets/images/home.png' with the path to your image
                          width: 30, // Adjust width as needed
                          height: 30, // Adjust height as needed
                        ),
                        SizedBox(width: 4), // Adjust spacing between image and text
                        Text(
                          'Log Out',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ],

              ),

            ),

          ),
        ),
      ),
    );
  }
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit'),
        content: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              // Close the application
              SystemNavigator.pop();
            },
            child: Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}