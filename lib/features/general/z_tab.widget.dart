import 'package:flutter/material.dart';

class ZTab {
  final String title;
  final Tab tab;
  final Widget child;

  const ZTab({
    required this.title,
    required this.tab,
    required this.child,
  });
}
