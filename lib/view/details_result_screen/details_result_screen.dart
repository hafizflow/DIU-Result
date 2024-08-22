import 'package:diu_result/utils/background/background.dart';
import 'package:flutter/material.dart';
import '../../model/semester_result_model.dart';
import '../../utils/const/color.dart';

class DetailsResultScreen extends StatelessWidget {
  const DetailsResultScreen({
    super.key,
    required this.result,
    required this.semesterNameYear,
  });

  final List<SemesterResultModel> result;
  final String semesterNameYear;

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: BackButton(color: CColor.offWhite),
                ),
                Text(
                  semesterNameYear,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: CColor.offDark,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade800),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .65,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      result[index].courseTitle.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      'Credit : ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      result[index]
                                          .totalCredit!
                                          .toInt()
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      'Grade : ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      result[index].gradeLetter.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: getColorForPointEquivalent(
                                result[index].pointEquivalent ?? 0.0,
                              ),
                              child: Text(
                                result[index].pointEquivalent.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getColorForPointEquivalent(double pointEquivalent) {
    switch (pointEquivalent) {
      case 4.0:
        return Colors.green.shade900;
      case 3.75:
        return Colors.teal.shade800;
      case 3.5:
        return Colors.teal.shade600;
      case 3.25:
        return Colors.teal.shade400;
      case 3.0:
        return Colors.blue.shade700;
      case 2.75:
        return Colors.yellow.shade900;
      case 2.5:
        return Colors.orange.shade900;
      case 2.25:
        return Colors.orange;
      case 2.0:
        return Colors.red;
      case 0.0:
        return Colors.red.shade900;
      default:
        return Colors.grey; // Default color if no match is found
    }
  }
}
