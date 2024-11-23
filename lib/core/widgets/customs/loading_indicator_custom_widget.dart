import 'package:flutter/material.dart';
import '../../utils/app_util.dart';

import '../../themes/app_theme.dart';

class LoadingIndicatorCustomWidget extends StatelessWidget {
  final String? loadingText;
  final double loadingSize;
  const LoadingIndicatorCustomWidget({
    super.key,
    this.loadingText,
    required this.loadingSize,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = moodThemeIsDark(context);

    return PopScope(
      canPop: false,
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.colors.darkPrimary : Colors.white.withOpacity(0.9),
            shape: BoxShape.rectangle,
            borderRadius: AppTheme.radius.small,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
