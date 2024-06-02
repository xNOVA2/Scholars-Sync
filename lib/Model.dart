class UserModel {
  String? name;
  String? email;
  String? password;
  List<int>? classNo; // Change from String to List<String>
  String? profilePicture;
  String? school;
  String? role;
  String? id;
  String? rollNumber;
  String? subjectName;
  List<String>? subjects;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.classNo,
    this.profilePicture,
    this.school,
    this.id,
    this.role,
    this.rollNumber,
    this.subjectName,
    this.subjects,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'class': classNo,
      'profilePicture': profilePicture,
      'selectedSchool': school,
      'teacherID':id,
      'role': role,
      'rollNumber': rollNumber,
      'subjectName':subjectName,
      'subjects': subjects,
    };
  }
}
