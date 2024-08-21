import 'package:flutter/material.dart';

import '../../../utils/common/widget/personal_info_text.dart';
import '../../../utils/const/color.dart';

class SemesterInformation extends StatelessWidget {
  const SemesterInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        color: CColor.offDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Semester Information',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 12),
              const PersonalInfoText(
                label: 'ID ',
                data: '',
              ),
              const SizedBox(height: 3),
              const PersonalInfoText(
                label: 'Credit ',
                data: '',
              ),
              const SizedBox(height: 3),
              const PersonalInfoText(
                label: 'Semester ',
                data: '',
              ),
              const SizedBox(height: 3),
              const PersonalInfoText(
                label: 'Year ',
                data: '',
              ),
              const SizedBox(height: 3),
              const PersonalInfoText(
                label: 'Batch ',
                data: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
