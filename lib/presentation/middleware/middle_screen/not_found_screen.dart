import 'package:flutter/material.dart';

import '../../../core/core.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.basic(context: context, title: 'Error Navigasi'),
      body: InfoWidget.noData(
        context: context,
        title: 'Ups!',
        subtitle: 'Ada kesalahan navigasi',
      ),
    );
  }
}
