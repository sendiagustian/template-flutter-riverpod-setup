import 'package:flutter/material.dart';
import '../utils/app_util.dart';

import 'customs/shimmer_custom_widget.dart';

class ShimmerWidget {
  static Widget box({double width = 100, double height = 100, EdgeInsetsGeometry? margin}) {
    return ShimmerCustomWidget(
      child: Builder(builder: (context) {
        bool isDark = moodThemeIsDark(context);
        return Container(
          margin: margin,
          width: width,
          height: height,
          color: isDark ? Colors.grey[850]! : Colors.grey[350]!,
        );
      }),
    );
  }

  static Widget text({double width = 100, double height = 20, EdgeInsetsGeometry? margin}) {
    return ShimmerCustomWidget(
      child: Builder(builder: (context) {
        bool isDark = moodThemeIsDark(context);
        return Container(
          margin: margin,
          width: width,
          height: height,
          color: isDark ? Colors.grey[850]! : Colors.grey[350]!,
        );
      }),
    );
  }

  static Widget icon({double size = 24, EdgeInsetsGeometry? margin}) {
    return ShimmerCustomWidget(
      child: Builder(builder: (context) {
        bool isDark = moodThemeIsDark(context);
        return Container(
          margin: margin,
          width: size,
          height: size,
          color: isDark ? Colors.grey[850]! : Colors.grey[350]!,
        );
      }),
    );
  }
}
