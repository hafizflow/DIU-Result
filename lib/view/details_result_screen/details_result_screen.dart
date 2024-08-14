import 'package:diu_result/utils/background/background.dart';
import 'package:diu_result/utils/common/widget/personal_info_text.dart';
import 'package:diu_result/view/over_all_result_screen/widget/appbar_title.dart';
import 'package:flutter/material.dart';
import '../../model/semester_result_model.dart';

class DetailsResultScreen extends StatelessWidget {
  const DetailsResultScreen({super.key, required this.result});

  final List<SemesterResultModel> result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppBarTitle(isShowBack: true),
                  Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white.withOpacity(.3),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: PersonalInfoText(
                                  label: 'Subject:',
                                  name: result[index].courseTitle.toString()),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PersonalInfoText(
                                  label: 'Grade: ',
                                  name: result[index].gradeLetter.toString(),
                                ),
                                const SizedBox(height: 2),
                                PersonalInfoText(
                                  label: 'Grade Point: ',
                                  name:
                                      result[index].pointEquivalent.toString(),
                                ),
                              ],
                            ),
                            trailing: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Text(result[index].totalCredit.toString()),
                            ),
                          ),
                        );
                      },
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
