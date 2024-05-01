import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/Home_page.dart';
import 'package:scholars_sync/QuizPage.dart';
import 'package:scholars_sync/routes.dart';

import 'BookSession.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
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
                  Image.asset(
                    'assets/images/alarm.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 0),
                  // Add space between alarm and notification icon
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.black),
                    onPressed: () {
                      // Add onPressed action for notification icon
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
                onTap: () {
                  // Add onTap action for the image
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Session()),
                  ); // Navigate to quiz page
                },
                child: Container(
                  width: 500,
                  // Adjust width as needed
                  height: 130,
                  // Adjust height as needed
                  alignment: Alignment.topCenter,
                  // Align the image to the top center
                  child: Image.asset(
                    'assets/images/session.png',
                    width: 600, // Adjust width as needed
                    height: 200, // Adjust height as needed
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
                        MaterialPageRoute(builder: (context) => Session()),
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
                                  ' Upcoming one on one session',
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
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '      Start Quizs',
                  style: GoogleFonts.nunito(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 4.0),
              Container(
                height: 160, // Adjust the height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageInfo.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          tappedIndex = index;
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          tappedIndex = null;
                        });
                        // Handle onTap for each subject image
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPage()),
                        );
                      },
                      onTapCancel: () {
                        setState(() {
                          tappedIndex = null;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        width: 120,
                        // Adjust the width as needed
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTapDown: (_) {
                              setState(() {
                                tappedIndex = index;
                              });
                            },
                            onTapUp: (_) {
                              setState(() {
                                tappedIndex = null;
                              });
                              // Handle onTap for each subject image
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizPage()),
                              );
                            },
                            onTapCancel: () {
                              setState(() {
                                tappedIndex = null;
                              });
                            },
                            child: Transform.scale(
                              scale: tappedIndex == index ? 1.1 : 1.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    imageInfo[index]['path']!,
                                    width: 40, // Adjust the width as needed
                                    height: 40, // Adjust the height as needed
                                  ),
                                  SizedBox(height: 5),
                                  // Adjust the spacing as needed
                                  Text(
                                    imageInfo[index]['title']!,
                                    style: GoogleFonts.nunito(fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    imageInfo[index]['description']!,
                                    style: GoogleFonts.nunito(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    );
                  },
                ),
              ),
              SizedBox(height: 3),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '      Upcoming Live Classes',
                  style: GoogleFonts.nunito(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  // Handle onTap
                  Get.toNamed(MyRoutes.JustThereRoute);
                },
                child: Center(
                  child: Container(
                    width: 350,
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
                child: Center(
                  child: Container(
                    width: 350,
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
                child: Center(
                  child: Container(
                    width: 350,
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFCFFD4),
                ),
              ),
              ListTile(
                title: Text('Profile view'),
                onTap: () {
                  // Add onTap action for drawer item 1
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  // Add onTap action for drawer item 2
                },
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                  // Add onTap action for drawer item 3
                  Get.to(HomePage());
                },
              ),
            ],
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