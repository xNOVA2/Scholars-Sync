import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholars_sync/CreateAccount.dart';
import 'package:scholars_sync/FinalStep.dart';
import 'package:scholars_sync/FinishSetup.dart';
import 'package:scholars_sync/GettingStartTeacher.dart';
import 'package:scholars_sync/GettingStarted.dart';
import 'package:scholars_sync/JustThere.dart';
import 'package:scholars_sync/StuDashboard.dart';
import 'package:scholars_sync/routes.dart';
import 'CreateAccountTeacher.dart';
import 'JustThereT.dart';
import 'PicturePage.dart';
import 'StudentPage.dart';
import 'TeacherPage.dart';
import 'TeacherProfilePic.dart';
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
        GetPage(name: MyRoutes.TeacherPictureRoute, page: () => TeacherProfilePic()),
        GetPage(name: MyRoutes.GettingStartedRoute, page: ()=> GettingStarted()),
        GetPage(name: MyRoutes.GettingStartedTeacherRoute, page: ()=> GettingStartedTeacher()),
        GetPage(name: MyRoutes.JustThereRoute, page: ()=> JustThere()),
        GetPage(name: MyRoutes.JustThereTeacherRoute, page: ()=> JustThereTeacher()),
        //GetPage(name: MyRoutes.StudentDashboardRoute, page: ()=> StudentDashboard()),
        //GetPage(name: MyRoutes.SubjectRoute, page: ()=> Subject()),
        //GetPage(name: MyRoutes.FinishSetupRoute, page: ()=> FinishSetup())

      ],
    );
  }
}
