import 'package:flutter/material.dart';

import '../../../core/widgets/button_widget.dart';
import '../../../core/widgets/info_widget.dart';
import '../../constants/enums/type_enums.dart';

class DisabledAccountScreen extends StatelessWidget {
  const DisabledAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfoWidget.noData(
        context: context,
        title: 'Ups!',
        subtitle: 'Akun kamu tidak aktif, coba kontak admin untuk masalah ini.',
        button: ButtonWidget.ractangle(
          context: context,
          type: ButtonType.primary,
          text: 'Hubungi Admin',
          leftIcon: Icons.telegram_rounded,
          onPressed: () {},
        ),
      ),
    );
  }
}
