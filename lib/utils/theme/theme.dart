import 'package:diu_result/utils/theme/custome_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'custome_theme/text_field_theme.dart';

class DIUResultAppTheme {
  DIUResultAppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    inputDecorationTheme: CTextFieldTheme.inputDecorationTheme,
    textTheme: CTextTheme.textTheme,
  );
}
