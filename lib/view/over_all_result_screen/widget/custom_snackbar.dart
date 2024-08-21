import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required String title,
  required String message,
  required ContentType contentType,
}) {
  return SnackBar(
    elevation: 0,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    dismissDirection: DismissDirection.startToEnd,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    ),
  );
}
