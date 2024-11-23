import 'package:flutter/material.dart';
import 'package:mobiletemplate/core/utils/app_util.dart';

class BoxShadowsTheme {
  const BoxShadowsTheme();

  List<BoxShadow> get basic {
    return [
      const BoxShadow(
        color: Color(0x111C1B76),
        blurRadius: 26.96,
        offset: Offset(0, 3.68),
        spreadRadius: 0,
      ),
    ];
  }

  List<BoxShadow> box(BuildContext context) {
    bool isDark = moodThemeIsDark(context);
    return [
      BoxShadow(
        color: isDark ? Colors.black26 : Colors.grey[400]!,
        offset: const Offset(0.4, 1),
        blurRadius: 2,
      ),
    ];
  }
}
