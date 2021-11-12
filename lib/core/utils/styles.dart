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
}
