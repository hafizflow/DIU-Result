import 'package:flutter/material.dart';

class PersonalInfoText extends StatelessWidget {
  final String label;
  final String name;

  const PersonalInfoText({
    super.key,
    required this.label,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
