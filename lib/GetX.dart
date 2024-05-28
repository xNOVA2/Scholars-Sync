import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'Model.dart';
import 'dart:convert';
import 'dart:io';

class UserController extends GetxController {
  var userModel = UserModel().obs;

  void setName(String name) {
    userModel.update((user) {
      user?.name = name;
    });
  }

  void setEmail(String email) {
    userModel.update((user) {
      user?.email = email;
    });
  }

  void setPassword(String password) {
    userModel.update((user) {
      user?.password = password;
    });
  }


  void setClass(List<String> classNo) {
    userModel.update((user) {
      user?.classNo = classNo;
    });
  }

  void setProfilePicture(String profilePicture) {
    userModel.update((user) {
      user?.profilePicture = profilePicture;
    });
  }

  void setSchool(String school) {
    userModel.update((user) {
      user?.school = school;
    });
  }

  void setRole(String role) {
    userModel.update((user) {
      user?.role = role;
    });
  }

  void setRollNumber(String rollNumber) {
    userModel.update((user) {
      user?.rollNumber = rollNumber;
    });
  }

  void setSubjects(List<String> subjects) {
    userModel.update((user) {
      user?.subjects = subjects;
    });
  }
  void setTeacherID(String id) {
    userModel.update((user) {
      user?.id = id;
    });
  }
    void setSubject(String subjectName) {
      userModel.update((user) {
        user?.subjectName = subjectName;
      });
    }

    Future<void> Register() async {
      try {
        print('Starting createAccount API call');

        final uri = Uri.parse(
            'https://scholar-sync-be-r58o.vercel.app/api/auth/register');
        var request = http.MultipartRequest('POST', uri);

        request.fields['name'] = userModel.value.name ?? '';
        request.fields['email'] = userModel.value.email ?? '';
        request.fields['password'] = userModel.value.password ?? '';
        request.fields['profilePicture'] = userModel.value.profilePicture ?? '';
        request.fields['school'] = userModel.value.school ?? '';
        request.fields['role'] = userModel.value.role ?? '';
        request.fields['id'] = userModel.value.id ?? '';
        request.fields['rollNumber'] = userModel.value.rollNumber ?? '';


        if (userModel.value.classNo != null) {
          request.fields['class'] = jsonEncode(userModel.value.classNo);
        }

        if (userModel.value.subjects != null) {
          request.fields['subjects'] = jsonEncode(userModel.value.subjects);
        }

        var response = await request.send();

        if (response.statusCode == 200) {
          print('Account created successfully');
          var responseBody = await response.stream.bytesToString();
          print('Response body: $responseBody');
        } else {
          print('Failed to create account');
          var responseBody = await response.stream.bytesToString();
          print('Response body: $responseBody');
          throw Exception('Failed to create account');
        }
      } on HttpException catch (e) {
        print('HttpException: $e');
        throw Exception('HTTP issue: $e');
      } on FormatException catch (e) {
        print('FormatException: $e');
        throw Exception('Format issue: $e');
      } catch (e) {
        print('General exception: $e');
        throw Exception('Failed to create account: $e');
      }
    }
  }