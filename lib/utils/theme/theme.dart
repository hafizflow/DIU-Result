import 'package:flutter/material.dart';
import 'custome_theme/text_field_theme.dart';

class DIUResultAppTheme {
  DIUResultAppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    inputDecorationTheme: CTextFieldTheme.inputDecorationTheme,
  );
}
