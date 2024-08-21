import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/semester_result_controller.dart';
import '../../../model/semester_result_model.dart';
import '../../../utils/const/color.dart';
import '../../details_result_screen/details_result_screen.dart';
import 'grid_shimmer_effect.dart';

class AllSemesterCgpaGrid extends StatelessWidget {
  const AllSemesterCgpaGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final SemesterResultController controller =
        Get.find<SemesterResultController>();

    return Expanded(
      child: Obx(
        () {
          if (controller.inProgress) {
            return const GridShimmerEffect();
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Error: ${controller.errorMessage}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (controller.allSemesterResults.isEmpty) {
            return const Center(
              child: Text(
                'Search Your Result',
                style: TextStyle(color: Colors.white),
              ),
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
              String semesterNameYear =
                  "${semesterResults.first.semesterName} ${semesterResults.first.semesterYear}";

              // Calculate the average CGPA for the semester
              double? cgpa = semesterResults.first.cgpa;

              return GestureDetector(
                onTap: () => Get.to(
                  () => DetailsResultScreen(
                    result: semesterResults,
                    semesterNameYear: semesterNameYear,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: CColor.offDark,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cgpa.toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          semesterNameYear,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
