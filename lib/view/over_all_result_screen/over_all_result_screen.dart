import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:diu_result/utils/background/background.dart';
import 'package:diu_result/view/over_all_result_screen/widget/all_semester_cgpa_grid.dart';
import 'package:diu_result/view/over_all_result_screen/widget/custom_search_field.dart';
import 'package:diu_result/view/over_all_result_screen/widget/personal_info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverAllResultScreen extends StatelessWidget {
  const OverAllResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GetBuilder<PersonalInfoController>(builder: (controller) {
                return Column(
                  children: [
                    Text(
                      'DIU Result',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    CustomSearchField(),
                    const SizedBox(height: 16),
                    controller.personalInfoModel.studentId == null
                        ? const SizedBox.shrink()
                        : const PersonalInfoCard(),
                    const SizedBox(height: 16),
                    const AllSemesterCgpaGrid(),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
