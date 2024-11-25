import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../riverpod/state_provider/splash_state/splash_state_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const path = '/splash';
  static const name = 'Splash';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1900,
      ),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SplashState splashState = ref.watch(splashStateEventProvider);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: ScaleTransition(
              scale: animation,
              child: SizedBox(
                height: 130,
                width: AppTheme.double.screenW(context) * .8,
                child: Image.asset(
                  'assets/images/logo_name.png',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 72,
            left: 0,
            right: 0,
            child: Builder(
              builder: (context) {
                if (splashState.showLoading) {
                  return InfoWidget.loadingData();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
