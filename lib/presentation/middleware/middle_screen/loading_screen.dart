import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';

class LoadingScreen extends ConsumerWidget {
  final String? message;

  const LoadingScreen({super.key, this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: InfoWidget.loadingData(message: message),
    );
  }
}
