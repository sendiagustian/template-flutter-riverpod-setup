import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../domain/usecases/auth_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/enums/type_enums.dart';
import '../../data_provider/app_data/app_data_provider.dart';
import '../../data_provider/local_storage_data/local_session_data_provider.dart';

part 'auth_state_provider.g.dart';

class AuthState {
  GlobalKey<FormState> formKey;
  TextEditingController emailController;
  TextEditingController passwordController;
  FocusNode passwordFocus;
  ValueNotifier<bool> obscureText;

  AuthState({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.passwordFocus,
    required this.obscureText,
  });

  AuthState copyWith({
    GlobalKey<FormState>? formKey,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    FocusNode? passwordFocus,
    ValueNotifier<bool>? obscureText,
  }) {
    return AuthState(
      formKey: formKey ?? this.formKey,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      passwordFocus: passwordFocus ?? this.passwordFocus,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}

@riverpod
class AuthStateEvent extends _$AuthStateEvent {
  @override
  AuthState build() {
    AuthState initialData = AuthState(
      formKey: GlobalKey<FormState>(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      passwordFocus: FocusNode(),
      obscureText: ValueNotifier<bool>(true),
    );

    return initialData;
  }

  void updateObsecureText() {
    state = state.copyWith(obscureText: ValueNotifier<bool>(!state.obscureText.value));
  }

  void login(BuildContext context) async {
    AuthUseCase authUseCase = AuthUseCaseImpl();

    if (state.formKey.currentState!.validate()) {
      final AppDataEvent appDataEvent = ref.watch(appDataEventProvider.notifier);
      final LocalSessionDataEvent authTokenStreamEvent = ref.watch(localSessionDataEventProvider.notifier);

      state.passwordFocus.unfocus();
      DialogWidget.loadingPageIndicator(context: context);

      String token = await authUseCase.login(state.emailController.text, state.passwordController.text);
      appDataEvent.user = await appDataEvent.tokenToModel(token);
      authTokenStreamEvent.authToken = token;

      if (context.mounted) {
        AppNavigator.pop(context);
      }

      clearText();
    } else {
      DialogWidget.error(context: context, message: 'Please fill all fields');
    }
  }

  void logout(BuildContext context) {
    final LocalSessionDataEvent authTokenStreamEvent = ref.watch(localSessionDataEventProvider.notifier);
    AppNavigator.pop(context);

    DialogWidget.info(
      context: context,
      title: 'Confirmation',
      desc: 'Are you sure you want to log out of the application?',
      buttons: [
        DialogWidget.button(
          context: context,
          text: 'Yes',
          type: ButtonType.secondary,
          onPressed: () {
            AppNavigator.pop(context);
            DialogWidget.loadingPageIndicator(context: context);

            Future.delayed(const Duration(seconds: 1), () async {
              authTokenStreamEvent.clearAllSession();

              if (context.mounted) {
                AppNavigator.pop(context);
              }
            });
          },
        ),
        DialogWidget.button(
          context: context,
          text: 'Cancel',
          type: ButtonType.primary,
          onPressed: () {
            AppNavigator.pop(context);
          },
        ),
      ],
    );
  }

  void clearText() {
    state = state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
    );
  }
}
