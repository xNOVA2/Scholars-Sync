import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholars_sync/JustThereT.dart';
import 'package:scholars_sync/riverpods/register_teacher_pod.dart';
import 'package:scholars_sync/routes.dart';

import 'GetX.dart';

class GettingStartedTeacher extends ConsumerStatefulWidget {
  const GettingStartedTeacher({super.key});

  @override
  ConsumerState createState() => _GettingStartedTeacherState();
}

class _GettingStartedTeacherState extends ConsumerState<GettingStartedTeacher> {
  List<String> _schools = [
    "School A",
    "School B",
    "School C",
  ];
  final UserController userController = Get.find();
  String? school;

  @override
  Widget build(BuildContext context) {
    final register = ref.watch(registerPod);
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),

                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      " Getting Started",
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "  Select your school",
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  maxWidth: 310,
                  maxHeight: 50,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search School",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              GestureDetector(
                onTap: () {
                  setState(() {
                    school = 'Beaconhouse School System';
                  });
                  userController.setSchool(school!);
                  if(school != null){
                    register.school = school!;
                  }
                  Get.to(JustThereTeacher());
                },
                child: Container(
                  width: 310,
                  height: 70,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        'Beaconhouse School System',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/images/dots.png',
                          width: 45,
                          height: 45,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Other School",
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    children: _schools.map((school) {
                      return GestureDetector(
                        onTap: () {
                          userController.setSchool(school!);
                          register.school = school;
                          Get.toNamed(MyRoutes.JustThereTeacherRoute);
                        },
                        child: ListTile(
                          title: Text(school),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
