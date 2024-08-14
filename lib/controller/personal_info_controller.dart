
import 'package:diu_result/model/personal_info_model.dart';
import 'package:diu_result/services/network_caller_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/response_data.dart';
import '../utils/urls/urls.dart';

class PersonalInfoController extends GetxController {
  final TextEditingController idTEController = TextEditingController();

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  PersonalInfoModel _personalInfoModel = PersonalInfoModel();
  PersonalInfoModel get personalInfoModel => _personalInfoModel;

  Future<bool> getPersonalInfo(String studentId) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCallerService()
        .getRequest(Urls.personalInfoUrl(studentId));

    _inProgress = false;
    bool isSuccess = false;

    if (response.isSuccess) {
      _personalInfoModel = PersonalInfoModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
