import 'package:diu_result/controller/line_chart_controller.dart';
import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/common/widget/personal_info_text.dart';
import '../../../utils/const/color.dart';

class SemesterInformation extends StatelessWidget {
  const SemesterInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SemesterResultController>();
    final pController = Get.find<PersonalInfoController>();
    final lController = Get.find<LineChartController>();

    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        color: CColor.offDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Semester Information',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 12),
              PersonalInfoText(
                label: 'ID ',
                data: pController.idTEController.text,
              ),
              const SizedBox(height: 3),
              PersonalInfoText(
                label: 'Credit ',
                data: controller.totalCredit.toStringAsFixed(0),
              ),
              const SizedBox(height: 3),
              PersonalInfoText(
                label: 'Semester ',
                data: controller.allSemesterResults.length.toString(),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PersonalInfoText(
                        label: 'Year ',
                        data: (controller.allSemesterResults.length / 2)
                            .floorToDouble()
                            .toStringAsFixed(0),
                      ),
                      const SizedBox(height: 3),
                      PersonalInfoText(
                        label: 'Batch ',
                        data: pController.personalInfoModel.batchNo.toString(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: Obx(() {
                      return OutlinedButton(
                        onPressed: () => lController.toggle(),
                        child: Text(
                          'Average',
                          style: TextStyle(
                            fontSize: 12,
                            color: lController.showAvg.value
                                ? Colors.white.withOpacity(0.5)
                                : Colors.white,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
