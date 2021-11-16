import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class SegmentedSwitch extends StatelessWidget {
  final List<Tab> tabs;
  final int initialIndex;
  final ValueSetter<int> onChanged;

  const SegmentedSwitch({
    Key? key,
    required this.tabs,
    this.initialIndex = 0,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex,
      child: TabBar(
        tabs: tabs,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        onTap: onChanged,
        indicator: const BubbleTabIndicator(
          indicatorHeight: 30.0,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
    );
  }
}
