import 'package:get/get.dart';

class LineChartController extends GetxController {
  RxBool showAvg = false.obs;

  toggle() {
    showAvg.value = !showAvg.value;
    update();
  }
}
