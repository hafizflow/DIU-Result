class PersonalInfoModel {
  String? studentId;
  String? campusName;
  String? studentName;
  String? progShortName;
  String? departmentName;
  String? facultyName;
  String? shift;
  int? batchNo;

  PersonalInfoModel({
    this.studentId,
    this.campusName,
    this.studentName,
    this.progShortName,
    this.departmentName,
    this.facultyName,
    this.shift,
    this.batchNo,
  });

  PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    campusName = json['campusName'];
    studentName = json['studentName'];
    progShortName = json['progShortName'];
    departmentName = json['departmentName'];
    facultyName = json['facultyName'];
    shift = json['shift'];
    batchNo = json['batchNo'];
  }
}
