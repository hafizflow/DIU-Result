import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import '../model/response_data.dart';
import '../model/semester_result_model.dart';
import '../services/network_caller_service.dart';
import '../utils/urls/urls.dart';

class SemesterResultController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  late int count = 0;

  final RxList<List<SemesterResultModel>> _allSemesterResults =
      RxList<List<SemesterResultModel>>([]);
  List<List<SemesterResultModel>> get allSemesterResults => _allSemesterResults;

  Future<void> getAllSemesterResults(
      List<String> semesterIds, String studentId) async {
    _inProgress.value = true;
    _allSemesterResults.clear();
    update(); // Update to show progress indicator if needed

    try {
      for (String semesterId in semesterIds) {
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

          if (semesterResults.isEmpty) {
            count++;
            if (count == 3) {
              count = 0;
              break;
            }
          }

          // Add the list of semester results to the _allSemesterResults
          if (semesterResults.isNotEmpty) {
            _allSemesterResults.add(semesterResults);
            // Update the UI as _allSemesterResults is an RxList
            update();
          }
        } else {
          _errorMessage.value = response.errorMessage;
          update();
          break; // Exit the loop if an error occurs
        }
      }
    } catch (e) {
      _errorMessage.value = 'An error occurred: $e';
    } finally {
      _inProgress.value = false;
      update();
    }
  }
}
