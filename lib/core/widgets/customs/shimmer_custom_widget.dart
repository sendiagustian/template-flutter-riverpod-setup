import 'package:flutter/material.dart';
import '../../utils/app_util.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustomWidget extends StatelessWidget {
  final Widget child;
  const ShimmerCustomWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isDark = moodThemeIsDark(context);

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[900]! : Colors.grey[200]!,
      highlightColor: isDark ? Colors.grey[850]! : Colors.grey[350]!,
      child: child,
    );
  }
}
