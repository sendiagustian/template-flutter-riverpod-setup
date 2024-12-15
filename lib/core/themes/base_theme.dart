import 'package:flutter/material.dart';

import 'app_theme.dart';

class BaseTheme {
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: AppTheme.typography.themeLight,
      primaryTextTheme: AppTheme.typography.themeLight,
      fontFamily: AppTheme.typography.fontPrimary,
      scaffoldBackgroundColor: AppTheme.colors.bgLight,
      iconTheme: const IconThemeData(color: Colors.black),
      buttonTheme: const ButtonThemeData(alignedDropdown: true),
      typography: Typography.material2021(colorScheme: const ColorScheme.light()),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: AppTheme.colors.primary,
        primary: AppTheme.colors.primary,
        secondary: AppTheme.colors.secondary,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(color: AppTheme.colors.textPrimary),
        iconTheme: const IconThemeData(color: Colors.black, grade: 2),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppTheme.colors.white,
        textStyle: AppTheme.typography.bodyMedium,
        iconColor: Colors.black,
        shadowColor: Colors.grey[400],
        surfaceTintColor: Colors.black12,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: Colors.black,
        textColor: Colors.black,
        tileColor: AppTheme.colors.white,
        selectedColor: AppTheme.colors.primary,
        selectedTileColor: AppTheme.colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppTheme.colors.primary,
        foregroundColor: Colors.white,
      ),
      switchTheme: SwitchThemeData(
        trackOutlineWidth: const WidgetStatePropertyAll(.8),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTheme.colors.primary;
          }
          return AppTheme.colors.grey;
        }),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTheme.colors.grey;
          }
          return AppTheme.colors.grey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTheme.colors.primary.withValues(alpha: 0.3);
          }
          return AppTheme.colors.grey.withValues(alpha: 0.3);
        }),
        thumbIcon: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Icon(Icons.circle, size: 8, color: AppTheme.colors.primary);
          }
          return Icon(Icons.circle, size: 8, color: AppTheme.colors.grey);
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hoverColor: Colors.white,
        fillColor: Colors.white,
        hintStyle: AppTheme.typography.bodyMediumHint,
        contentPadding: AppTheme.geometry.smallX,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: Colors.grey[600]!,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: Colors.grey[400]!,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.primary,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.red,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.red,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: AppTheme.typography.themeDark,
      primaryTextTheme: AppTheme.typography.themeDark,
      fontFamily: AppTheme.typography.fontPrimary,
      scaffoldBackgroundColor: AppTheme.colors.bgDark,
      iconTheme: const IconThemeData(color: Colors.white),
      buttonTheme: const ButtonThemeData(alignedDropdown: true),
      typography: Typography.material2021(colorScheme: const ColorScheme.dark()),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: AppTheme.colors.primary,
        primary: AppTheme.colors.primary,
        secondary: AppTheme.colors.secondary,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        backgroundColor: AppTheme.colors.darkPrimary,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(color: AppTheme.colors.textPrimary),
        iconTheme: const IconThemeData(color: Colors.white, grade: 2),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppTheme.colors.primary,
        foregroundColor: Colors.white,
      ),
      switchTheme: SwitchThemeData(
        trackOutlineWidth: const WidgetStatePropertyAll(.8),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTheme.colors.primary;
          }
          return AppTheme.colors.grey;
        }),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTheme.colors.grey;
          }
          return AppTheme.colors.grey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTheme.colors.primary.withValues(alpha: 0.3);
          }
          return AppTheme.colors.grey.withValues(alpha: 0.3);
        }),
        thumbIcon: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Icon(Icons.circle, size: 8, color: AppTheme.colors.primary);
          }
          return Icon(Icons.circle, size: 8, color: AppTheme.colors.grey);
        }),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppTheme.colors.white,
        textColor: AppTheme.colors.white,
        tileColor: AppTheme.colors.darkPrimary,
        selectedColor: AppTheme.colors.primary,
        selectedTileColor: AppTheme.colors.darkPrimary,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppTheme.colors.darkPrimary,
        textStyle: AppTheme.typography.bodyMediumDark,
        iconColor: AppTheme.colors.white,
        shadowColor: AppTheme.colors.darkPrimary,
        surfaceTintColor: AppTheme.colors.darkPrimary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hoverColor: AppTheme.colors.darkPrimary,
        fillColor: AppTheme.colors.darkPrimary,
        hintStyle: AppTheme.typography.bodyMediumHintDark,
        contentPadding: AppTheme.geometry.smallX,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: Colors.grey[600]!,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: Colors.grey[400]!,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.primary,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.red,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.red,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
      ),
    );
  }
}
