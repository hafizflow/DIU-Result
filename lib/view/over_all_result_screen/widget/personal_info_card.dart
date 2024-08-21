import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/common/widget/personal_info_text.dart';
import '../../../utils/const/color.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalInfoController>(
      builder: (controller) {
        if (controller.inProgress) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return SizedBox(
          width: double.infinity,
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
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
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
                  AnimatedTextKit(animatedTexts: [
                    ColorizeAnimatedText(
                      'For More Information >>>',
                      textStyle: const TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: [
                        const Color(0xFFAAFFF8),
                        const Color(0xFFF8DE22),
                        const Color(0xFFF11A7B),
                        const Color(0xFF5C48AF),
                      ],
                      speed: const Duration(seconds: 1),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
