import 'package:flutter/material.dart';

import '../../const/color.dart';

class CTextFieldTheme {
  CTextFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    fillColor: CColor.offDark,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    suffixIconColor: CColor.offWhite,
    isDense: true,
  );
}
