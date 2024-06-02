// import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:scholars_sync/services/api_services.dart';
import 'package:dio/dio.dart';

final registerPod = ChangeNotifierProvider<RegisterModel>((ref) {
  return RegisterModel();
});

// ignore_for_file: prefer_final_fields

class RegisterModel extends ChangeNotifier {
  String? _name;
  String? _email;
  String? _password;
  String? _school;
  File? _profileImage;
  String? _role;
  String? _rollNumber;
  List<String> _subjects = [];
  List<int>? _classes;
  // bool _loaded = false;
  bool _loading = true;

  bool get isLoading => _loading;
  bool get isNotNull => _name!=null&&_email!=null&&_password!=null&&_school!=null&&_profileImage!=null&&_role!=null&&_rollNumber!=null&&_subjects.isNotEmpty&&_classes!=null;

  set name(String value) {
    _name = value;
  }

  set email(String value) {
    _email = value;
  }

  set password(String value) {
    _password = value;
  }

  set school(String value) {
    _school = value;
  }

  setProfileImage(String value) async {
    _profileImage = File(value);
  }

  set role(String value) {
    _role = value;
  }

  set rollNumber(String value) {
    _rollNumber = value;
  }

  set classes(List<int> value) {
    _classes = value;
  }

  set subjects(String value) {
    _subjects.add(value);
  }

  removeSubject(String value) {
    _subjects.remove(value);
  }

  Future<void>registerUser(BuildContext context) async {
    if (!_loading) {
      _loading = true;
    }
    if(isNotNull && _profileImage != null){
      String? fileName = _profileImage?.path.split('/').last;
      print(fileName);

      _subjects = ["66504e0851580d730ddfd7d7"];
    FormData res = FormData.fromMap(
        {
          "name": _name,
          "email": _email,
          "password": _password,
          "school": _school,
          "profileImage": await MultipartFile.fromFile(_profileImage!.path),
          "rollNumber": _rollNumber,
          "class": _classes,
          "subjects": _subjects,
          "role": _role,
        },
        ListFormat.multiCompatible,
        true

    );
    // print(utf8.decode(await res.readAsBytes(),allowMalformed: true));
    var response = await apiService.post("/auth/register", res);
    if (response["success"]) {
      //Store and open dashboard
    } else {
      //error
    }








  }
    _loading = false;
    notifyListeners();

  }
}
