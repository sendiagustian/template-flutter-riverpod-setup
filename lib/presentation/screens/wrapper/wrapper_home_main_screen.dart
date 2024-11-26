import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../riverpod/state_provider/wrapper_state/wrapper_state_provider.dart';
import '../../riverpod/stream_provider/auth_token_stream/auth_token_stream_provider.dart';
import '../home/home_screen.dart';

class WrapperHomeMainScreen extends ConsumerWidget {
  const WrapperHomeMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WrapperState wrapperState = ref.watch(wrapperStateEventProvider);
    final WrapperStateEvent wrapperEvent = ref.watch(wrapperStateEventProvider.notifier);
    final AuthTokenStreamEvent authTokenStreamEvent = ref.watch(authTokenStreamEventProvider.notifier);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) => exit(0),
      child: Scaffold(
        appBar: AppBarWidget.basic(
          context: context,
          centerTitle: false,
          title: 'Template App',
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () async {
                authTokenStreamEvent.clearAuthToken();
              },
            ),
          ],
        ),
        body: PageView(
          controller: wrapperState.pageController,
          onPageChanged: (index) {
            wrapperEvent.currentIndex = index;
          },
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            Center(child: Text('Maps')),
            Center(child: Text('Article')),
            Center(child: Text('Profile')),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 3,
          tooltip: 'Action',
          shape: RoundedRectangleBorder(borderRadius: AppTheme.radius.circle),
          backgroundColor: AppTheme.colors.primary,
          child: Image.asset(
            'assets/images/logo_white.png',
            width: 30,
          ),
          onPressed: () async {},
        ),
        bottomNavigationBar: NavBottomBarCustomWidget(
          height: 65,
          unselectedColor: Colors.grey,
          selectedColor: AppTheme.colors.primary,
          backgroundColor: Colors.white,
          notchedShape: const CircularNotchedRectangle(),
          selected: wrapperState.currentIndex,
          onTabSelected: (index) {
            wrapperState.pageController.jumpToPage(index);
          },
          items: [
            NavBottomBarCustomItem(
              iconData: Icons.home_filled,
              text: 'Beranda',
            ),
            NavBottomBarCustomItem(
              iconData: Icons.route_rounded,
              text: 'Maps',
            ),
            NavBottomBarCustomItem(
              iconData: Icons.menu_book_rounded,
              text: 'Article',
            ),
            NavBottomBarCustomItem(
              iconData: Icons.person_rounded,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
