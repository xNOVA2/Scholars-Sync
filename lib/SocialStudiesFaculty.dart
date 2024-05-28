import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialStudiesFaculty extends StatefulWidget {
  @override
  _SocialStudiesFacultyState createState() => _SocialStudiesFacultyState();
}

class _SocialStudiesFacultyState extends State<SocialStudiesFaculty> {
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
                            "    English Faculty ",
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
                      UserStatusBox(isActive: false, userImageUrl: 'https://via.placeholder.com/150'),
                      SizedBox(width: 20),
                      UserStatusBox(isActive: false, userImageUrl: 'https://via.placeholder.com/150'),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserStatusBox(isActive: false, userImageUrl: 'https://via.placeholder.com/150'),
                      SizedBox(width: 20),
                      UserStatusBox(isActive: false, userImageUrl: 'https://via.placeholder.com/150'),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserStatusBox(isActive: false, userImageUrl: 'https://via.placeholder.com/150'),
                      SizedBox(width: 20),
                      UserStatusBox(isActive: false, userImageUrl: 'https://via.placeholder.com/150'),
                    ],
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

class UserStatusBox extends StatefulWidget {
  final bool isActive;
  final String userImageUrl;

  UserStatusBox({
    required this.isActive,
    required this.userImageUrl,
  });

  @override
  _UserStatusBoxState createState() => _UserStatusBoxState();
}

class _UserStatusBoxState extends State<UserStatusBox> {
  double _padding = 6.0; // Initialize the padding variable

  void _handleTapDown() {
    setState(() {
      _padding = 0.0;
    });
  }

  void _handleTapUp() {
    setState(() {
      _padding = 6.0;
    });
  }

  void _showBookingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFCFFD4),
          title: Row(
            children: [
              Icon(Icons.check, color: Colors.green),
              SizedBox(width: 27),
              Text(
                "Booking Confirmed",
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          content: Text("Your session is successfully booked."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 158,
          height: 166,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 57),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(widget.userImageUrl),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        Positioned(
          top: 70,
          child: Container(
            decoration: BoxDecoration(
              color: widget.isActive ? Colors.lightGreen[100] : Colors.red[100],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.isActive ? Colors.green : Colors.red,
                        border: Border.all(color: Colors.transparent, width: 2),
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      widget.isActive ? 'Online' : 'Not Online',
                      style: GoogleFonts.nunito(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: widget.isActive ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          child: Column(
            children: [
              Text(
                "Name",
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                "Ranking",
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -20,
          child: GestureDetector(
            onTapDown: (_) => _handleTapDown(),
            onTapUp: (_) => _handleTapUp(),
            onTap: _showBookingDialog,
            child: AnimatedContainer(
              padding: EdgeInsets.only(bottom: _padding),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(17),
              ),
              duration: const Duration(milliseconds: 70),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFD700),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Text(
                  "Book Session",
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
