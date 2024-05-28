import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/Home_page.dart';
import 'package:scholars_sync/QuizPage.dart';
import 'package:scholars_sync/routes.dart';
import 'GetX.dart';
import 'BookSession.dart';
import 'ChangePassword.dart';
import 'ForgotPd.dart';
import 'MyProfile.dart';
import 'Rewards.dart';
import 'StudentPage.dart';
import 'package:scholars_sync/user_controller.dart';


class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
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

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
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
            children: [
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
              SizedBox(width: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/images/kiing.png',
                    width: 40,
                    height: 60,
                  ),
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
                  '   ${userController.userModel.value.name}',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Session()),
                  ); // Navigate to quiz page
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.18 * MediaQuery.of(context).size.height,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/session.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                      width: 0.93 * MediaQuery.of(context).size.width,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: GestureDetector(
                        onTap: () {
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
                                width: 40,
                                height: 40,
                              ),
                            ),

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
                height: 150,
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
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(height: 5),
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
                  Get.toNamed(MyRoutes.JustThereRoute);
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 73,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
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
                  Get.toNamed(MyRoutes.JustThereRoute);
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 73,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
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
                  Get.toNamed(MyRoutes.JustThereRoute);
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 73,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
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

                    Image.asset(
                      'assets/images/Kings.png', // Replace 'assets/images/your_image.png' with the path to your image
                      width: 100, // Adjust width as needed
                      height: 160, // Adjust height as needed
                    ),
                    SizedBox(width: 10), // Adjust spacing between image and column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userController.userModel.value.name}',
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Kings League',
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
                              MaterialPageRoute(builder: (context) => MyProfile()),
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
                                "View Profile",
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
                        'Badges and Rewards',
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
