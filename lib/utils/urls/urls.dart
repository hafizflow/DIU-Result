class Urls {
  static String personalInfoUrl(String studentId) =>
      "http://software.diu.edu.bd:8006/result/studentInfo?studentId=$studentId";

  static const String allSemesterIdNameUrl =
      "http://software.diu.edu.bd:8006/result/semesterList";

  static String semesterResultUrl(String semesterId, String studentId) =>
      "http://software.diu.edu.bd:8006/result?grecaptcha=&semesterId=$semesterId&studentId=$studentId";
}
