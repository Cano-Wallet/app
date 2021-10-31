import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmering extends StatelessWidget {
  final Widget child;
  final bool active;

  const Shimmering({
    Key? key,
    required this.child,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return active
        ? AbsorbPointer(
            absorbing: active,
            child: Shimmer.fromColors(
              child: child,
              baseColor: Colors.grey.shade700,
              highlightColor: Colors.white,
            ),
          )
        : child;
  }
}
