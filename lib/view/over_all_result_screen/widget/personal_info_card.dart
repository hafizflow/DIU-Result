import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:diu_result/utils/common/widget/custom_route.dart';
import 'package:diu_result/view/over_all_result_screen/widget/card_shimmer_effect.dart';
import 'package:diu_result/view/result_statistics/result_statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/common/widget/personal_info_text.dart';
import '../../../utils/const/color.dart';
import 'animated_text.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalInfoController>(
      builder: (controller) {
        if (controller.inProgress) {
          return const CardShimmerEffect();
        }
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            CustomRoute(page: const ResultStatisticsScreen()),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade700),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Card(
              margin: EdgeInsets.zero,
              color: CColor.offDark,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    PersonalInfoText(
                      label: 'Name',
                      data: controller.personalInfoModel.studentName ?? '',
                    ),
                    const SizedBox(height: 2),
                    PersonalInfoText(
                      label: 'Program',
                      data: controller.personalInfoModel.progShortName ?? '',
                    ),
                    const SizedBox(height: 2),
                    PersonalInfoText(
                      label: 'Campus',
                      data: controller.personalInfoModel.campusName ?? '',
                    ),
                    const SizedBox(height: 2),
                    PersonalInfoText(
                      label: 'Shift',
                      data: controller.personalInfoModel.shift ?? '',
                    ),
                    const SizedBox(height: 2),
                    PersonalInfoText(
                      label: 'Department',
                      data: controller.personalInfoModel.departmentName ?? '',
                    ),
                    const SizedBox(height: 2),
                    PersonalInfoText(
                      label: 'Faculty',
                      data: controller.personalInfoModel.facultyName ?? '',
                    ),
                    const SizedBox(height: 4),
                    const CAnimatedText(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
