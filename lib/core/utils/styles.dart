import 'package:flutter/material.dart';

class Styles {
  static final outlinedButtonStyle20 = OutlinedButton.styleFrom(
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static final outlinedButtonStyle20Red = OutlinedButton.styleFrom(
    primary: Colors.red,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static const dashboardNumberStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  static final inputDecoration = InputDecoration(
    enabledBorder: inputBorder,
    errorBorder: inputBorder,
    focusedBorder: inputBorder,
    focusedErrorBorder: inputBorder,
  );

  static const containerConstraints = BoxConstraints(maxWidth: 500);
}
