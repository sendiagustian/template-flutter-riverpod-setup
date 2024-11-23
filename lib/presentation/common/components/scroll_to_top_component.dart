import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/themes/app_theme.dart';

class ScrollToTopComponent extends ConsumerWidget {
  final ScrollController scrollController;
  const ScrollToTopComponent({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 24,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.primary,
          borderRadius: AppTheme.radius.circle,
        ),
        child: IconButton(
          onPressed: () {
            scrollController.animateTo(0, duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
          },
          icon: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
