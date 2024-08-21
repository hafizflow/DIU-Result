import 'package:flutter/material.dart';

class PersonalInfoText extends StatelessWidget {
  final String label;
  final String data;

  const PersonalInfoText({
    super.key,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextSpan(
            text: data,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
