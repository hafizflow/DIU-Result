import 'package:diu_result/controller/line_chart_controller.dart';
import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:diu_result/model/semester_cgpa_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const/app_color.dart';

class LineChartSample2 extends StatelessWidget {
  LineChartSample2({super.key});

  final controller = Get.find<SemesterResultController>();

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColorsBlue = [
      AppColors.contentColorCyan,
      AppColors.contentColorBlue,
    ];

    List<Color> gradientColorsRed = [
      AppColors.contentColorOrange,
      AppColors.contentColorRed,
    ];

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: 0,
          top: 0,
          bottom: 20,
        ),
        child: GetBuilder<LineChartController>(
          builder: (lController) {
            return LineChart(
              lController.showAvg.value
                  ? avgData(controller, lController, gradientColorsRed)
                  : mainData(controller, gradientColorsBlue),
            );
          },
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(
      double value, TitleMeta meta, List<SemesterCgpaModel> semesterNameCg) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );

    // Convert the double value to an int for comparison
    int index = value.toInt() - 1;

    // Initialize a variable to hold the widget
    Widget text;

    // Check if the index is within the bounds of the semesterCgpaList
    if (index >= 0 && index < semesterNameCg.length) {
      // Get the corresponding SemesterCgpaModel
      SemesterCgpaModel semesterCgpa = semesterNameCg[index];

      // Create the text widget with the semester name and year
      text = Text(
        '${semesterCgpa.semesterName}\n${semesterCgpa.semesterYear}',
        style: style,
        textAlign: TextAlign.center,
      );
    } else {
      text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String text;
    switch (value.toDouble()) {
      case 0:
        text = '0.0';
        break;
      case 1:
        text = '1.0';
        break;
      case 2:
        text = '2.0';
        break;
      case 3:
        text = '3.0';
        break;
      case 4:
        text = '4.0';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(
      SemesterResultController controller, List<Color> gradientColors) {
    return LineChartData(
      minX: .8,
      maxX: controller.semesterNameCg.length.toDouble(),
      minY: 0,
      maxY: 5,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 2,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                bottomTitleWidgets(value, meta, controller.semesterNameCg),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 32,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            controller.semesterNameCg.length,
            (index) {
              final cgpa = controller.semesterNameCg[index].cgpa;
              return FlSpot(index.toDouble() + 1, cgpa);
            },
          ),
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData(SemesterResultController controller,
      LineChartController lineController, List<Color> gradientColors) {
    return LineChartData(
      minX: .8,
      maxX: controller.semesterNameCg.length.toDouble(),
      minY: 0,
      maxY: 5,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 2,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                bottomTitleWidgets(value, meta, controller.semesterNameCg),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 32,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            controller.semesterNameCg.length,
            (index) {
              return FlSpot(
                  index.toDouble() + 1, controller.cgpa.toPrecision(2));
            },
          ),
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
