import 'package:diu_result/utils/common/widget/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.sizeOf(context).height * .4,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/anime.json',
                        width: MediaQuery.sizeOf(context).width * .8,
                        height: MediaQuery.sizeOf(context).height * .4,
                        fit: BoxFit.fitWidth,
                      ),
                      const Text(
                        'Search your result',
                        style: TextStyle(letterSpacing: 1, wordSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
                onTap: () => Navigator.push(
                  context,
                  CustomRoute(
                    page: DetailsResultScreen(
                      result: semesterResults,
                      semesterNameYear: semesterNameYear,
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: CColor.offDark,
                    border: Border.all(color: Colors.grey.shade700),
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
