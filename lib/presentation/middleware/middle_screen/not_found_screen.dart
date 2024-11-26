import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../constants/enums/type_enums.dart';
import '../middleware.dart';

class NotFoundScreen extends StatelessWidget {
  static const path = '/404';
  static const name = 'NotFoundScreen';

  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.basic(context: context, title: 'Error Navigasi'),
      body: Container(
        padding: AppTheme.geometry.medium,
        child: InfoWidget.noData(
          context: context,
          title: 'Ups!',
          subtitle: 'Ada kesalahan navigasi',
          button: ButtonWidget.ractangle(
            context: context,
            text: 'Back to Home',
            type: ButtonType.primary,
            onPressed: () {
              AppNavigator.push(context, Middleware.path);
            },
          ),
        ),
      ),
    );
  }
}
