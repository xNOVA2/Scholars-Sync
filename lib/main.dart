import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholars_sync/CreateAccount.dart';
import 'package:scholars_sync/EnglishFaculty.dart';
import 'package:scholars_sync/FinalStep.dart';
import 'package:scholars_sync/FinishSetup.dart';
import 'package:scholars_sync/GetX.dart';
import 'package:scholars_sync/GettingStartTeacher.dart';
import 'package:scholars_sync/GettingStarted.dart';
import 'package:scholars_sync/JustThere.dart';
import 'package:scholars_sync/StuDashboard.dart';
import 'package:scholars_sync/routes.dart';
import 'Availability.dart';
import 'BiologyFaculty.dart';
import 'ChangePassword.dart';
import 'CreateAccountTeacher.dart';
import 'EditProfile.dart';
import 'EditTeacherProfile.dart';
import 'EmailVerify.dart';
import 'IslamicStudiesFaculty.dart';
import 'MathsFaculty.dart';
import 'JustThereT.dart';
import 'Leaderboard.dart';
import 'MyProfile.dart';
import 'PicturePage.dart';
import 'Rewards.dart';
import 'ScienceFaculty.dart';
import 'SessionsList.dart';
import 'Slots.dart';
import 'SocialStudiesFaculty.dart';
import 'StartLive.dart';
import 'StudentPage.dart';
import 'TeacherDashboard.dart';
import 'TeacherPage.dart';
import 'TeacherProfile.dart';
import 'TeacherProfilePic.dart';
import 'home_page.dart';
import 'splashscreen.dart';



void main() {
  // Initialize GetX dependencies
  Get.put(UserController()); // Immediate registration
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
        GetPage(name: '/StudentRoute', page: () => StudentForm()),
        GetPage(name: '/TeacherRoute', page: () => TeacherForm()),
        GetPage(name: '/CreateAccountRoute', page: () => CreateAccountPage() ),
        GetPage(name: '/CreateAccountTeacherRoute', page: () => CreateAccountTeacher()),
        GetPage(name: '/ProfilePageRoute', page: () => ProfilePage()),
        GetPage(name: '/TeacherPictureRoute', page: () => TeacherProfilePic()),
        GetPage(name: '/GettingStartedRoute', page: ()=> GettingStarted()),
        GetPage(name: '/GettingStartedTeacherRoute', page: ()=> GettingStartedTeacher()),
        GetPage(name: '/JustThereRoute', page: ()=> JustThere()),
        GetPage(name: '/JustThereTeacherRoute', page: ()=> JustThereTeacher()),
        GetPage(name: '/StudentDashboardRoute', page: ()=> StudentDashboard()),
        GetPage(name: '/TeacherDashboardRoute', page: ()=> TeacherDashboard()),
        GetPage(name: '/FinishSetupRoute', page: ()=> FinishSetup()),
        GetPage(name: '/StartLive', page: ()=> StartLive()),
        GetPage(name: '/SessionsRequest', page: ()=> SessionsRequest()),
        GetPage(name: '/ChangePasswrod', page: ()=> ChangePassword()),
        GetPage(name: '/Rewards' , page: ()=> Rewards()),
        GetPage(name: '/MyProfile', page: ()=> MyProfile()),
        GetPage(name: '/EditProfile', page: ()=> EditProfile()),
        GetPage(name: '/TeacherProfile', page:()=> TeacherProfile()),
        GetPage(name: '/EditTeacherProfileRoute' , page:()=> EditTeacherProfile()),
        GetPage(name: '/Leaderboard' , page:()=> Leaderboard()),
        GetPage(name: '/Availability' , page:()=> Availability()),
        GetPage(name: '/Slots' , page:()=> Slots()),
        GetPage(name: '/EmailVerify', page:()=> EmailVerify()),
        GetPage(name: '/MathsFaculty', page:()=> MathsFaculty()),
        GetPage(name: '/EnglishFaculty',page: ()=> EnglishFaculty()),
        GetPage(name: '/EnglishFaculty',page: ()=> IslamicStudiesFaculty()),
        GetPage(name: '/EnglishFaculty',page: ()=> BiologyFaculty()),
        GetPage(name: '/EnglishFaculty',page: ()=> ScienceFaculty()),
        GetPage(name: '/EnglishFaculty',page: ()=> SocialStudiesFaculty()),
      ],
    );
  }
}
