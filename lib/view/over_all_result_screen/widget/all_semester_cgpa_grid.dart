import 'dart:developer';

import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:diu_result/view/details_result_screen/details_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllSemesterCgpaGrid extends StatelessWidget {
  const AllSemesterCgpaGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<SemesterResultController>(builder: (controller) {
        return GridView.builder(
          itemCount: controller.allSemesterResults.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 140,
          ),
          itemBuilder: (context, index) {
            final result = controller.allSemesterResults[index];
            // log(controller.allSemesterResults.length.toString());
            return GestureDetector(
              onTap: () => Get.to(() => DetailsResultScreen(result: result)),
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
                        result.cgpa.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        '${result.semesterName} ${result.semesterYear}',
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
