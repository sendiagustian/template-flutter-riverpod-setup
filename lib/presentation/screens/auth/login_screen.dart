import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/utils/validator_text_field_util.dart';
import '../../../core/widgets/button_widget.dart';
import '../../../core/widgets/input_widget.dart';
import '../../common/components/version_info_component.dart';
import '../../constants/enums/type_enums.dart';
import '../../riverpod/state_provider/auth_state/auth_state_provider.dart';

class LoginScreen extends ConsumerWidget {
  static const path = '/login';
  static const name = 'Login';

  const LoginScreen({super.key});

  static final ValidatorTextFieldUtil validator = ValidatorTextFieldUtil();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthStateEvent authStateEvent = ref.watch(authStateEventProvider.notifier);
    final AuthState authState = ref.watch(authStateEventProvider);

    return Scaffold(
      body: Container(
        height: AppTheme.double.screenH(context),
        decoration: BoxDecoration(
          gradient: AppTheme.colors.gradientBgScreen(context),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: authState.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTheme.spacing.customY(40),
                Image.asset(
                  'assets/icons/icon_app.png',
                  width: 43,
                  height: 43,
                ),
                AppTheme.spacing.customY(40),
                Text(
                  'hallo!, Welcome back',
                  style: AppTheme.typography.headlineMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppTheme.spacing.customY(40),
                InputWidget.formFieldInput(
                  context: context,
                  controller: authState.emailController,
                  title: 'Email',
                  hintText: 'Your email',
                  validator: validator.validateNotEmpty,
                ),
                AppTheme.spacing.mediumY,
                InputWidget.formFieldInput(
                  context: context,
                  obscureText: authState.obscureText.value,
                  controller: authState.passwordController,
                  focusNode: authState.passwordFocus,
                  title: 'Password',
                  hintText: 'Your password',
                  validator: validator.validateNotEmpty,
                  onEditingComplete: () => authStateEvent.login(context),
                  suffixIcon: IconButton(
                    onPressed: () {
                      authStateEvent.updateObsecureText();
                    },
                    icon: Icon(authState.obscureText.value ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                AppTheme.spacing.largeY,
                ButtonWidget.ractangle(
                  context: context,
                  text: 'Login',
                  width: AppTheme.double.screenW(context),
                  type: ButtonType.primary,
                  onPressed: () {
                    authStateEvent.login(context);
                  },
                ),
                const VersionInfoComponent(verticalMargin: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
