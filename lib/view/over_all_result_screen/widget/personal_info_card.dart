import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/common/widget/personal_info_text.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white.withOpacity(.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          child: GetBuilder<PersonalInfoController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PersonalInfoText(
                    label: 'Name',
                    name: controller.personalInfoModel.studentName ?? '',
                  ),
                  const SizedBox(height: 2),
                  PersonalInfoText(
                    label: 'Program',
                    name: controller.personalInfoModel.progShortName ?? '',
                  ),
                  const SizedBox(height: 2),
                  PersonalInfoText(
                    label: 'Campus',
                    name: controller.personalInfoModel.campusName ?? '',
                  ),
                  const SizedBox(height: 2),
                  PersonalInfoText(
                    label: 'Shift',
                    name: controller.personalInfoModel.shift ?? '',
                  ),
                  const SizedBox(height: 2),
                  PersonalInfoText(
                    label: 'Department',
                    name: controller.personalInfoModel.departmentName ?? '',
                  ),
                  const SizedBox(height: 2),
                  PersonalInfoText(
                    label: 'Faculty',
                    name: controller.personalInfoModel.facultyName ?? '',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
