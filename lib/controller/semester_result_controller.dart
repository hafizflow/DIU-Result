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

  final RxList<List<SemesterResultModel>> _allSemesterResults =
      RxList<List<SemesterResultModel>>([]);
  List<List<SemesterResultModel>> get allSemesterResults => _allSemesterResults;

  Future<void> getAllSemesterResults(
      List<String> semesterIds, String studentId) async {
    _inProgress = true;
    _allSemesterResults.clear();
    update();

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

        // log(semesterResults.toString());

        // Add the list of semester results to the _allSemesterResults
        if (semesterResults.isNotEmpty) {
          _allSemesterResults.add(semesterResults);
        }
      } else {
        _errorMessage = response.errorMessage;
      }
    }

    _inProgress = false;
    update();
  }
}
