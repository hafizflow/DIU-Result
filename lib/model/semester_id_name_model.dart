class SemesterIdNameModel {
  List<Semester>? semesters;

  SemesterIdNameModel({this.semesters});

  SemesterIdNameModel.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      semesters = json.map((item) => Semester.fromJson(item)).toList();
    }
  }
}

class Semester {
  String? semesterId;
  String? semesterName;

  Semester({this.semesterId, this.semesterName});

  Semester.fromJson(Map<String, dynamic> json) {
    semesterId = json['semesterId'].toString();
    semesterName = json['semesterName'];
  }
}
