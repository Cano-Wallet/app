import 'package:flutter/material.dart';

class Styles {
  static final roundedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );

  static final outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  static final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  static final elevatedButtonStyle = ElevatedButton.styleFrom(
    shape: roundedBorder,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
  );

  static final outlinedButtonStyle = OutlinedButton.styleFrom(
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static final outlinedButtonStyleNegative = OutlinedButton.styleFrom(
    primary: Colors.red,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static const dashboardNumberStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final elevatedButtonStyleNegative = ElevatedButton.styleFrom(
    primary: Colors.red,
    shape: roundedBorder,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
  );

  static final textButtonStyleNegative = OutlinedButton.styleFrom(
    primary: Colors.red,
    shape: roundedBorder,
  );

  static final inputDecoration = InputDecoration(
    enabledBorder: outlineBorder,
    errorBorder: outlineBorder,
    focusedBorder: outlineBorder,
    focusedErrorBorder: outlineBorder,
    isDense: true,
  );

  static const containerConstraints = BoxConstraints(maxWidth: 500);
}
