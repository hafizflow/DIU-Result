import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:diu_result/controller/semester_id_name_controller.dart';
import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  final pController = Get.find<PersonalInfoController>();
  final sIdNameController = Get.find<SemesterIdNameController>();
  final sResultController = Get.find<SemesterResultController>();

  final GlobalKey<FormState> searchKey = GlobalKey<FormState>();

  /// Function to handle the personal info search operation
  Future<bool> personalInfoSearch() async {
    return await pController.getPersonalInfo(
      pController.idTEController.text.trim(),
    );
  }

  /// Function to handle the result search operation
  Future<void> resultSearch() async {
    bool success = await sIdNameController.getAllSemesterIdName();

    if (success && sIdNameController.semesterIds.isNotEmpty) {
      await sResultController.getAllSemesterResults(
        sIdNameController.semesterIds,
        pController.idTEController.text.trim(),
      );
    }
  }
}
