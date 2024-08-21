import 'package:diu_result/utils/background/background.dart';
import 'package:diu_result/view/result_statistics/widget/circular_chart.dart';
import 'package:diu_result/view/result_statistics/widget/semester_infromation.dart';
import 'package:flutter/material.dart';
import '../../utils/const/color.dart';

class ResultStatisticsScreen extends StatelessWidget {
  const ResultStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(color: CColor.offWhite),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Text(
                            'Excellent!!',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontSize: 34),
                          ),
                          const CircularChart(),
                          const SemesterInformation(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
