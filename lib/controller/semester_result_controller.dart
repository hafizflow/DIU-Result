import 'dart:async';
import 'dart:developer';
import 'package:diu_result/model/semester_cgpa_model.dart';
import 'package:get/get.dart';
import '../model/response_data.dart';
import '../model/semester_result_model.dart';
import '../services/network_caller_service.dart';
import '../utils/urls/urls.dart';

class SemesterResultController extends GetxController {
  /// For showing progress indicator
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  /// For showing error message
  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  /// For showing progress indicator
  final RxDouble _cgpa = 0.0.obs;
  double get cgpa => _cgpa.value;

  /// For showing total credit completed
  final RxDouble _totalCredit = 0.0.obs;
  double get totalCredit => _totalCredit.value;

  /// For the cgpa percentage
  final RxDouble _percentage = 0.0.obs;
  double get percentage => _percentage.value;

  /// For storing all semester result and use the list
  final RxList<List<SemesterResultModel>> _allSemesterResults =
      RxList<List<SemesterResultModel>>([]);
  List<List<SemesterResultModel>> get allSemesterResults => _allSemesterResults;

  /// For storing only the semester name and cgpa
  final RxList<SemesterCgpaModel> _semesterNameCg =
      RxList<SemesterCgpaModel>([]);
  List<SemesterCgpaModel> get semesterNameCg => _semesterNameCg;

  Future<void> getAllSemesterResults(
      List<String> semesterIds, String studentId) async {
    _inProgress.value = true;
    _allSemesterResults.clear();
    _semesterNameCg.clear();
    update();
    String semesterIdInitial = studentId.substring(0, 3);
    try {
      int startIndex = semesterIds.indexOf(semesterIdInitial);
      List<String> filteredSemesterIds = semesterIds.sublist(0, startIndex + 1);
      filteredSemesterIds.sort((b, a) => b.compareTo(a));
      for (String semesterId in filteredSemesterIds) {
        final ResponseData response = await NetworkCallerService()
            .getRequest(Urls.semesterResultUrl(semesterId, studentId));

        if (response.isSuccess) {
          List<dynamic> responseData = response.responseData;

          // Create a list to hold the results for this semester
          List<SemesterResultModel> semesterResults = [];

          for (var result in responseData) {
            // Convert each result to a SemesterResultModel
            final semesterResultModel = SemesterResultModel.fromJson(result);
            semesterResults.add(semesterResultModel);
          }

          log(semesterResults.toString());

          // Add the list of semester results to the _allSemesterResults
          if (semesterResults.isNotEmpty) {
            _allSemesterResults.add(semesterResults);
            update();
          }
        } else {
          _errorMessage.value = response.errorMessage;
          update();
          break;
        }
      }

      double totalPoints = 0.0;
      double totalCredits = 0.0;

      for (List<SemesterResultModel> semesterResults in allSemesterResults) {
        if (semesterResults.isNotEmpty) {
          SemesterResultModel firstResult = semesterResults.first;

          // Assuming semesterName, semesterYear, and cgpa are accessible from firstResult
          SemesterCgpaModel semesterCgpa = SemesterCgpaModel(
            semesterName: firstResult.semesterName!,
            semesterYear: firstResult.semesterYear!,
            cgpa: firstResult.cgpa!,
          );

          _semesterNameCg.add(semesterCgpa);
        }

        for (SemesterResultModel result in semesterResults) {
          totalPoints += result.pointEquivalent! * result.totalCredit!;
          totalCredits += result.totalCredit!;
        }
      }

      if (totalCredits > 0) {
        _totalCredit.value = totalCredits;
        _cgpa.value = totalPoints / totalCredits;
        _percentage.value = (_cgpa.value / 4) * 100;
      } else {
        _cgpa.value = 0.0;
      }
    } catch (e) {
      _errorMessage.value = 'An error occurred: $e';
    } finally {
      _inProgress.value = false;
      update();
    }
  }
}
