import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ResetPassword.dart';
import 'StudentPage.dart';

class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  double _padding = 6.0;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/kiing.png',
                            width: 70,
                            height: 70,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "   Badges & Rewards ",
                      style: GoogleFonts.nunito(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 0.93 * MediaQuery.of(context).size.width,
                    height: 178,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildRewardColumn('assets/images/half.png', 'Junior', '30 points'),
                          buildRewardColumn('assets/images/middle.png', 'Prince', '60 points'),
                          buildRewardColumn('assets/images/kiing.png', 'King', '90 points'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 19),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Rewards',
                      style: GoogleFonts.nunito(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  buildRewardCard(
                      'Shopping Vouchers',
                      '40pts',
                      'Get 60% discount on all shopping malls\nin Karachi'
                  ),

                  SizedBox(height: 10),
                  buildRewardCard(
                      'Shopping Vouchers',
                      '40pts',
                      'Get 60% discount on all shopping malls\nin Karachi'
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildRewardColumn(String imagePath, String title, String points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Image.asset(
          imagePath,
          width: 100,
          height: 60,
        ),
        SizedBox(height: 19),
        Text(
          '      $title',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
        ),
        Text(
          '       $points',
          style: GoogleFonts.nunito(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }

  Widget buildRewardCard(String title, String points, String description) {
    return GestureDetector(
      child: Material(
        elevation: 4, // Adjust the elevation value as needed
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 0.93 * MediaQuery.of(context).size.width,
          height: 107,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: IconButton(
                  icon: Icon(Icons.notifications, color: Colors.red[900]),
                  onPressed: () {
                    // Add onPressed action for notification icon
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 66),
                      Text(
                        points,
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
