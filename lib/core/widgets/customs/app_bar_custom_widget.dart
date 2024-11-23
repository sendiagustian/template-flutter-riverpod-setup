import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobiletemplate/core/utils/app_util.dart';

class AppBarCustomWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool? centerTitle;
  final Widget? leading;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final List<Widget>? actions;
  final double elevation;
  final bool automaticallyImplyLeading;

  const AppBarCustomWidget({
    super.key,
    this.title,
    this.centerTitle,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.backgroundGradient,
    this.automaticallyImplyLeading = true,
    this.elevation = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    assert((backgroundColor == null && backgroundGradient != null) ||
        (backgroundColor != null && backgroundGradient == null) ||
        (backgroundColor == null && backgroundGradient == null));

    return Container(
      decoration: BoxDecoration(
        color: backgroundGradient != null ? null : backgroundColor ?? AppBarTheme.of(context).backgroundColor,
        gradient: backgroundColor != null ? null : backgroundGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.1),
            spreadRadius: elevation,
            blurRadius: elevation + 3,
            offset: Offset(0, elevation),
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: centerTitle,
        leading: leading,
        elevation: 0.0,
        title: title,
        iconTheme: IconThemeData(
          color: _getIconColor(
            context,
            backgroundColor ?? backgroundGradient?.colors.first ?? AppBarTheme.of(context).backgroundColor!,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: actions,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: _getBrightness(
            context,
            backgroundColor ?? backgroundGradient?.colors.first ?? AppBarTheme.of(context).backgroundColor!,
          ),
          statusBarBrightness: _getBrightness(
            context,
            backgroundColor ?? backgroundGradient?.colors.first ?? AppBarTheme.of(context).backgroundColor!,
          ),
          systemNavigationBarIconBrightness: _getBrightness(
            context,
            backgroundColor ?? backgroundGradient?.colors.first ?? AppBarTheme.of(context).backgroundColor!,
          ),
        ),
      ),
    );
  }

  Color _getIconColor(BuildContext context, Color color) {
    Brightness brightness = _getBrightness(context, color);

    if (brightness == Brightness.light) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Brightness _getBrightness(BuildContext context, Color color) {
    bool isDark = moodThemeIsDark(context);

    if (isDark) {
      return Brightness.light;
    } else {
      return colorsBrightnessStatusBar(color);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
