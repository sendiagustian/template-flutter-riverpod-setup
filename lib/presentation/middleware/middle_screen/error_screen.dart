import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ErrorScreen extends StatelessWidget {
  static const String path = '/error';
  static const String name = 'Error Screen';

  final bool enableAppBar;
  final bool enableButton;
  final String message;

  const ErrorScreen({
    super.key,
    this.enableAppBar = false,
    this.enableButton = true,
    this.message = 'There was a technical error, please close and not return the application.',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: enableAppBar ? AppBarWidget.basic(context: context, title: 'Ada Error') : null,
      body: InfoWidget.noData(
        context: context,
        title: 'Ups!',
        subtitle: message,
      ),
    );
  }
}
