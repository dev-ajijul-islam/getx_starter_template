import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../presentation/widgets/common_appbar.dart';
import '../../../../presentation/widgets/common_card.dart';
import '../../../../presentation/widgets/common_text.dart';
import '../../../../presentation/widgets/common_tab_bar.dart';
import '../../controllers/bottom_nav_controller.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

class BottomNavHolderScreen extends GetView<BottomNavController> {
  const BottomNavHolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      const _HomeTab(),
      const _SimplePage(title: 'Discover'),
      const _SimplePage(title: 'Activity'),
      const ProfileScreen(),
    ];

    return Obx(
      () => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: CommonAppbar(
            title: _titles[controller.currentIndex.value],
          ),
          body: pages[controller.currentIndex.value],
          bottomNavigationBar: NavigationBar(
            selectedIndex: controller.currentIndex.value,
            onDestinationSelected: controller.changeIndex,
            destinations: const <NavigationDestination>[
              NavigationDestination(icon: Icon(Icons.home_outlined), label: AppStrings.home),
              NavigationDestination(icon: Icon(Icons.explore_outlined), label: AppStrings.discover),
              NavigationDestination(icon: Icon(Icons.local_activity_outlined), label: AppStrings.activity),
              NavigationDestination(icon: Icon(Icons.person_outline_rounded), label: AppStrings.profile),
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> _titles = <String>['Home', 'Discover', 'Activity', 'Profile'];

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CommonTabBar(tabs: <String>['Overview', 'Popular', 'Recent']),
        Expanded(
          child: TabBarView(
            children: <Widget>[
              _tabBody('Overview content for your starter template.'),
              _tabBody('Popular content section.'),
              _tabBody('Recent content section.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tabBody(String title) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        CommonCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonText(text: title, fontSize: 20, fontWeight: FontWeight.w700),
              const SizedBox(height: 8),
              const CommonText(
                text: 'Use this page as your dashboard placeholder. Replace with API driven content.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SimplePage extends StatelessWidget {
  const _SimplePage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonText(text: '$title Screen', fontSize: 22, fontWeight: FontWeight.w700),
    );
  }
}
