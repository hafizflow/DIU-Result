import 'package:flutter/material.dart';

class CTextFieldTheme {
  CTextFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    fillColor: Colors.white.withOpacity(0.3),
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    suffixIconColor: Colors.white,
    isDense: true,
  );
}
