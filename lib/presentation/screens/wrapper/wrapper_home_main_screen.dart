import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../riverpod/data_provider/local_storage_data/local_session_data_provider.dart';
import '../../riverpod/state_provider/wrapper_state/wrapper_state_provider.dart';
import '../home/home_screen.dart';
import '../settings/settings_screen.dart';

class WrapperHomeMainScreen extends ConsumerWidget {
  const WrapperHomeMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WrapperState wrapperState = ref.watch(wrapperStateEventProvider);
    final WrapperStateEvent wrapperEvent = ref.watch(wrapperStateEventProvider.notifier);
    final LocalSessionDataEvent localStorageDataEvent = ref.watch(localSessionDataEventProvider.notifier);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) => exit(0),
      child: Scaffold(
        appBar: AppBarWidget.basic(
          context: context,
          centerTitle: false,
          title: 'Template App',
          automaticallyImplyLeading: false,
          actions: _buildActionPopMenu(context: context, listMenu: [
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                AppNavigator.pop(context);
                AppNavigator.push(context, SettingsScreen.path);
              },
              contentPadding: AppTheme.geometry.mediumX,
              trailing: const Icon(Icons.settings),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                AppNavigator.pop(context);
                localStorageDataEvent.clearAllSession();
              },
              contentPadding: AppTheme.geometry.mediumX,
              trailing: Icon(Icons.logout, color: AppTheme.colors.red),
            ),
          ]),
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

  List<Widget> _buildActionPopMenu({
    required BuildContext context,
    required List<ListTile> listMenu,
  }) {
    return [
      PopupMenuButton<String>(
        offset: const Offset(-32, 12),
        icon: Icon(Icons.more_vert, color: Colors.grey[600]),
        menuPadding: AppTheme.geometry.zero,
        padding: AppTheme.geometry.zero,
        tooltip: 'Menu',
        itemBuilder: (BuildContext context) {
          return List.generate(listMenu.length, (i) {
            final menu = listMenu[i];
            return PopupMenuItem<String>(
              padding: EdgeInsets.zero,
              child: menu,
            );
          });
        },
      )
    ];
  }
}
