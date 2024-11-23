import 'package:flutter/material.dart';
import 'package:mobiletemplate/core/utils/app_util.dart';

class ColorsTheme {
  const ColorsTheme();

  // Light Theme
  Color get primary => const Color(0XFF2F80ED);
  Color get secondary => const Color(0xFF5AADFF);
  Color get accent => const Color(0xFFF5F4B3);
  Color get tertiary => const Color(0xFFFFFECB);

  // Dark Theme
  Color get darkPrimary => const Color(0xFF272A32);
  Color get darkSecondary => const Color(0xFF272A32);

  Color get white => const Color(0xFFFEFEFE);
  Color get grey => const Color(0xFFACACAC);
  Color get red => const Color(0xFFEF476F);
  Color get yellow => const Color(0xFFFFD166);

  Color get bgDark => const Color(0xFF212122);
  Color get bgLight => const Color(0xFFF2F6FC);

  Color get divider => const Color(0xFFBDBDBD);

  Color get textPrimary => const Color(0xFF222834);
  Color get textSecondary => const Color(0xFF353F54);

  LinearGradient gradientPrimary(BuildContext context) {
    final isDark = moodThemeIsDark(context);

    if (!isDark) {
      return LinearGradient(
        stops: const [0.0, 1.0],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1, 0.0),
        colors: [primary, secondary],
        tileMode: TileMode.clamp,
      );
    } else {
      return LinearGradient(
        stops: const [0.0, 1.0],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1, 0.0),
        colors: [darkPrimary, darkSecondary],
        tileMode: TileMode.clamp,
      );
    }
  }

  LinearGradient gradientBgScreen(BuildContext context) {
    final isDark = moodThemeIsDark(context);

    if (!isDark) {
      return LinearGradient(
        colors: [
          primary.withOpacity(0.45),
          bgLight,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0, 0.6],
      );
    } else {
      return LinearGradient(
        colors: [
          darkPrimary.withOpacity(0.45),
          bgDark,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0, 0.6],
      );
    }
  }
}
