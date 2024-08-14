
import 'package:diu_result/model/semester_id_name_model.dart';
import 'package:get/get.dart';

import '../model/response_data.dart';
import '../services/network_caller_service.dart';
import '../utils/urls/urls.dart';

class SemesterIdNameController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  SemesterIdNameModel _allSemesterIdNameModel = SemesterIdNameModel();
  SemesterIdNameModel get allSemesterIdNameModel => _allSemesterIdNameModel;

  // List to store the semester IDs
  List<String> _semesterIds = [];
  List<String> get semesterIds => _semesterIds;

  Future<bool> getAllSemesterIdName() async {
    _inProgress = true;
    update();

    final ResponseData response =
        await NetworkCallerService().getRequest(Urls.allSemesterIdNameUrl);

    _inProgress = false;
    bool isSuccess = false;

    if (response.isSuccess) {
      _allSemesterIdNameModel =
          SemesterIdNameModel.fromJson(response.responseData);
      isSuccess = true;

      if (_allSemesterIdNameModel.semesters != null) {
        _semesterIds = _allSemesterIdNameModel.semesters!
            .map((s) => s.semesterId.toString())
            .toList();
      } else {
        _semesterIds = [];
      }
    } else {
      _errorMessage = response.errorMessage;
    }

    update();
    return isSuccess;
  }
}
