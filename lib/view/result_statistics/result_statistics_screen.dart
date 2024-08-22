import 'package:diu_result/utils/background/background.dart';
import 'package:diu_result/view/result_statistics/widget/circular_chart.dart';
import 'package:diu_result/view/result_statistics/widget/line_chart.dart';
import 'package:diu_result/view/result_statistics/widget/semester_infromation.dart';
import 'package:diu_result/view/result_statistics/widget/wish_message.dart';
import 'package:flutter/material.dart';
import '../../utils/const/color.dart';

class ResultStatisticsScreen extends StatelessWidget {
  const ResultStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: BackButton(color: CColor.offWhite),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 16,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        const WishMessage(),
                        const CircularChart(),
                        const SemesterInformation(),
                        LineChartSample2()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
