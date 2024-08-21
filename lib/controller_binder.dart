import 'package:diu_result/controller/api_controller.dart';
import 'package:diu_result/controller/semester_id_name_controller.dart';
import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalInfoController>(() => PersonalInfoController());
    Get.lazyPut<SemesterIdNameController>(() => SemesterIdNameController());
    Get.lazyPut<SemesterResultController>(() => SemesterResultController());
    Get.lazyPut<ApiController>(() => ApiController());
  }
}
