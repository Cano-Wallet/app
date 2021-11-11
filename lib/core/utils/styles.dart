import 'package:flutter/material.dart';

class Styles {
  static final outlinedButtonStyle5 = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  );

  static final outlinedButtonStyle20 = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static final outlinedButtonStyle20Red = OutlinedButton.styleFrom(
    primary: Colors.red,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static const dashboardNumberStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
