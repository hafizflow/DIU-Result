class SemesterResultModel {
  String? semesterId;
  String? semesterName;
  int? semesterYear;
  String? customCourseId;
  String? courseTitle;
  double? totalCredit;
  double? pointEquivalent;
  String? gradeLetter;
  double? cgpa;

  SemesterResultModel({
    this.semesterId,
    this.semesterName,
    this.semesterYear,
    this.customCourseId,
    this.courseTitle,
    this.totalCredit,
    this.pointEquivalent,
    this.gradeLetter,
    this.cgpa,
  });

  SemesterResultModel.fromJson(Map<String, dynamic> json) {
    semesterId = json['semesterId'];
    semesterName = json['semesterName'];
    semesterYear = json['semesterYear'];
    customCourseId = json['customCourseId'];
    courseTitle = json['courseTitle'];
    totalCredit = json['totalCredit'];
    pointEquivalent = json['pointEquivalent'];
    gradeLetter = json['gradeLetter'];
    cgpa = json['cgpa'];
  }

  @override
  String toString() {
    return 'SemesterResultModel(semesterId: $semesterId, semesterName: $semesterName, semesterYear: $semesterYear, customCourseId: $customCourseId, courseTitle: $courseTitle, totalCredit: $totalCredit, pointEquivalent: $pointEquivalent, gradeLetter: $gradeLetter, cgpa: $cgpa)';
  }
}
