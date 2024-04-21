import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholars_sync/CreateAccount.dart';
import 'package:scholars_sync/routes.dart';
import 'CreateAccountTeacher.dart';
import 'PicturePage.dart';
import 'StudentPage.dart';
import 'TeacherPage.dart';
import 'home_page.dart';
import 'splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: MyRoutes.homeRoute, page: () => HomePage()),
        GetPage(name: MyRoutes.StudentRoute, page: () => StudentForm()),
        GetPage(name: MyRoutes.TeacherRoute, page: () => TeacherForm()),
        GetPage(name: MyRoutes.CreateAccountRoute, page: () => CreateAccountPage() ),
        GetPage(name: MyRoutes.CreateAccountTeacherRoute, page: () => CreateAccountTeacher()),
        GetPage(name: MyRoutes.ProfilePageRoute, page: () => ProfilePage()),

        //GetPage(name: MyRoutes.stuProfileRoute, page: () => StuProfileRoute()),
        //GetPage(name: MyRoutes.teacherProfileRoute, page: () => TeacherProfileRoute()),
      ],
    );
  }
}
