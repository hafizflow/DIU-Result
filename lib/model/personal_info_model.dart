class PersonalInfoModel {
  String? studentId;
  String? campusName;
  String? studentName;
  String? progShortName;
  String? departmentName;
  String? facultyName;
  String? shift;

  PersonalInfoModel({
    this.studentId,
    this.campusName,
    this.studentName,
    this.progShortName,
    this.departmentName,
    this.facultyName,
    this.shift,
  });

  PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    campusName = json['campusName'];
    studentName = json['studentName'];
    progShortName = json['progShortName'];
    departmentName = json['departmentName'];
    facultyName = json['facultyName'];
    shift = json['shift'];
  }

  void clear() {
    studentId = null;
    campusName = null;
    studentName = null;
    progShortName = null;
    departmentName = null;
    facultyName = null;
    shift = null;
  }
}
