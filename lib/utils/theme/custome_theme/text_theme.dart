import 'package:flutter/material.dart';

import '../../const/color.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme textTheme = const TextTheme(
    labelMedium: TextStyle(
      color: CColor.offWhite,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: CColor.offWhite,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleMedium: TextStyle(
      color: CColor.offWhite,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headlineMedium: TextStyle(
      color: CColor.offWhite,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
}
