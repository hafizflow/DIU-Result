import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/semester_result_model.dart';
import '../../details_result_screen/details_result_screen.dart';

class AllSemesterCgpaGrid extends StatelessWidget {
  const AllSemesterCgpaGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<SemesterResultController>(builder: (controller) {
        if (controller.inProgress) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        return GridView.builder(
          itemCount: controller.allSemesterResults.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 140,
          ),
          itemBuilder: (context, index) {
            List<SemesterResultModel> semesterResults =
                controller.allSemesterResults[index];

            // Assuming all courses in a semester have the same semesterName and semesterYear
            String? semesterName = semesterResults.first.semesterName;
            String semesterYear = semesterResults.first.semesterYear.toString();

            // Calculate the average CGPA for the semester
            double? cgpa = semesterResults.first.cgpa;

            return GestureDetector(
              onTap: () =>
                  Get.to(() => DetailsResultScreen(result: semesterResults)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cgpa.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        '$semesterName $semesterYear',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
