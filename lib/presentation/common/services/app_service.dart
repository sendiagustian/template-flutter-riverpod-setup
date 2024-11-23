import 'package:flutter/material.dart';

import '../../../core/shared/app_navigator.dart';
import '../../../core/widgets/dialog_widget.dart';

class AppService {
  void callHelpDesk(BuildContext context) async {
    DialogWidget.loadingPageIndicator(context: context);

    // HelpDeskUseCase useCase = HelpDeskUseCaseImpl();
    // String? numberHelpDesk = await useCase.getHelpDesk();

    // Uri uri = Uri.parse('https://wa.me/$numberHelpDesk');
    // if (!await launchUrl(uri)) {
    //   if (context.mounted) {
    //     AppNavigator.pop(context);
    //     InfoWidget.showSnackBar(context: context, content: const Text('whatsapp no installed'), duration: 3);
    //   }
    // }
    if (context.mounted) AppNavigator.pop(context);
  }

  void callUpdateApk(BuildContext context) async {
    DialogWidget.loadingPageIndicator(context: context);
    // Uri uri = Uri.parse(UrlConst.updateUrl);
    // if (!await launchUrl(uri)) {
    //   if (context.mounted) AppNavigator.pop(context);
    //   throw Exception('Could not launch $uri');
    // }

    if (context.mounted) AppNavigator.pop(context);
  }
}
