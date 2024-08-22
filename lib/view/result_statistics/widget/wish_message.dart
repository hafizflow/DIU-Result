import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishMessage extends StatelessWidget {
  const WishMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SemesterResultController>();

    return Text(
      getFunnyMessage(controller.cgpa),
      maxLines: 2,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 30),
    );
  }

  String getFunnyMessage(double gradePoint) {
    if (gradePoint == 4.00) {
      return 'Outstanding! You nailed it!';
    } else if (gradePoint >= 3.75) {
      return 'Excellent! Keep it up!';
    } else if (gradePoint >= 3.50) {
      return 'Very Good! You\'re almost there!';
    } else if (gradePoint >= 3.25) {
      return 'Good Job! Keep pushing!';
    } else if (gradePoint >= 3.00) {
      return 'Satisfactory! Nice effort!';
    } else if (gradePoint >= 2.75) {
      return 'Above Average! Keep improving!';
    } else if (gradePoint >= 2.50) {
      return 'Average! You can do better!';
    } else if (gradePoint >= 2.25) {
      return 'Below Average! Time to buckle up!';
    } else if (gradePoint >= 2.00) {
      return 'Just Passed! Phew!';
    } else {
      return 'Failed! Don\'t give up!';
    }
  }
}
