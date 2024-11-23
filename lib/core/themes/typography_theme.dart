import 'package:flutter/material.dart';

import 'app_theme.dart';

class TypographyTheme {
  const TypographyTheme();

  String get fontPrimary => 'Nunito';
  String get fontSecondary => 'Inter';
  String get fontGothic => 'Gothic';

  TextStyle get displayLarge {
    return const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle get displayLargeDark {
    return displayLarge.copyWith(color: Colors.white);
  }

  TextStyle get displayMedium {
    return const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get displayMediumDark {
    return displayMedium.copyWith(color: Colors.white);
  }

  TextStyle get displaySmall {
    return const TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get displaySmallDark {
    return displaySmall.copyWith(color: Colors.white);
  }

  TextStyle get headlineLarge {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headlineLargeDark {
    return headlineLarge.copyWith(color: Colors.white);
  }

  TextStyle get headlineMedium {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headlineMediumDark {
    return headlineMedium.copyWith(color: Colors.white);
  }

  TextStyle get headlineSmall {
    return const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headlineSmallDark {
    return headlineSmall.copyWith(color: Colors.white);
  }

  TextStyle get titleLarge {
    return const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get titleLargeDark {
    return titleLarge.copyWith(color: Colors.white);
  }

  TextStyle get titleMedium {
    return const TextStyle(
      fontSize: 18.5,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get titleMediumDark {
    return titleMedium.copyWith(color: Colors.white);
  }

  TextStyle get titleSmall {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get titleSmallDark {
    return titleSmall.copyWith(color: Colors.white);
  }

  TextStyle get bodyLarge {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get bodyLargeDark {
    return bodyLarge.copyWith(color: Colors.white);
  }

  TextStyle get bodyLargeHint {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.textSecondary,
    );
  }

  TextStyle get bodyLargeHintDark {
    return bodyLargeHint.copyWith(color: Colors.white54);
  }

  TextStyle get bodyMedium {
    return const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get bodyMediumDark {
    return bodyMedium.copyWith(color: Colors.white);
  }

  TextStyle get bodyMediumHint {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.textSecondary,
    );
  }

  TextStyle get bodyMediumHintDark {
    return bodyMediumHint.copyWith(color: Colors.white54);
  }

  TextStyle get bodySmall {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get bodySmallDark {
    return bodySmall.copyWith(color: Colors.white);
  }

  TextStyle get bodySmallHint {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.textSecondary,
    );
  }

  TextStyle get bodySmallHintDark {
    return bodySmallHint.copyWith(color: Colors.white54);
  }

  TextStyle get labelLarge {
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get labelLargeDark {
    return labelLarge.copyWith(color: Colors.white);
  }

  TextStyle get labelMedium {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get labelMediumDark {
    return labelMedium.copyWith(color: Colors.white);
  }

  TextStyle get labelSmall {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get labelSmallDark {
    return labelSmall.copyWith(color: Colors.white);
  }

  TextTheme get themeLight {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: AppTheme.colors.textPrimary),
      displayMedium: displayMedium.copyWith(color: AppTheme.colors.textPrimary),
      displaySmall: displaySmall.copyWith(color: AppTheme.colors.textPrimary),
      headlineMedium: headlineMedium.copyWith(color: AppTheme.colors.textPrimary),
      headlineSmall: headlineSmall.copyWith(color: AppTheme.colors.textPrimary),
      titleLarge: titleLarge.copyWith(color: AppTheme.colors.textPrimary),
      bodyLarge: bodyLarge.copyWith(color: AppTheme.colors.textPrimary),
      bodyMedium: bodyMedium.copyWith(color: AppTheme.colors.textPrimary),
      bodySmall: bodySmall.copyWith(color: AppTheme.colors.textPrimary),
      labelLarge: labelLarge.copyWith(color: AppTheme.colors.textPrimary),
      labelMedium: labelMedium.copyWith(color: AppTheme.colors.textPrimary),
      labelSmall: labelSmall.copyWith(color: AppTheme.colors.textPrimary),
    );
  }

  TextTheme get themeDark {
    return TextTheme(
      displayLarge: displayLargeDark,
      displayMedium: displayMediumDark,
      displaySmall: displaySmallDark,
      headlineMedium: headlineMediumDark,
      headlineSmall: headlineSmallDark,
      titleLarge: titleLargeDark,
      bodyLarge: bodyLargeDark,
      bodyMedium: bodyMediumDark,
      bodySmall: bodySmallDark,
      labelLarge: labelLargeDark,
      labelMedium: labelMediumDark,
      labelSmall: labelSmallDark,
    );
  }
}
