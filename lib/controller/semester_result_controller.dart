import 'dart:developer';

import 'package:get/get.dart';
import '../model/response_data.dart';
import '../model/semester_result_model.dart';
import '../services/network_caller_service.dart';
import '../utils/urls/urls.dart';

class SemesterResultController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  final RxList<SemesterResultModel> _allSemesterResults =
      <SemesterResultModel>[].obs;
  List<SemesterResultModel> get allSemesterResults => _allSemesterResults;

  Future<void> getAllSemesterResults(
      List<String> semesterIds, String studentId) async {
    _inProgress = true;
    _allSemesterResults.clear();
    update();

    for (String semesterId in semesterIds) {
      final ResponseData response = await NetworkCallerService()
          .getRequest(Urls.semesterResultUrl(semesterId, studentId));

      // Set to keep track of unique results to prevent duplicates
      final Set<String> seenResults = {};

      if (response.isSuccess) {
        List<dynamic> responseData = response.responseData;

        for (var result in responseData) {
          // Assuming SemesterResultModel has a unique identifier such as `id`
          // Replace `resultIdentifier` with an actual unique identifier if it exists
          final semesterResultModel = SemesterResultModel.fromJson(result);
          final String resultIdentifier = semesterResultModel.toString();

          if (!seenResults.contains(resultIdentifier)) {
            _allSemesterResults.add(semesterResultModel);
            seenResults.add(resultIdentifier);
          }
        }
      } else {
        _errorMessage = response.errorMessage;
      }
    }

    log('All Semester Results: ${_allSemesterResults.map((e) => e.toString()).toList()}');

    _inProgress = false;
    update();
  }
}
