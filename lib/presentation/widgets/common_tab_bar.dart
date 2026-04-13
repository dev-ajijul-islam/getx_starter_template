import 'package:flutter/material.dart';

class CommonTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonTabBar({required this.tabs, super.key, this.controller});

  final List<String> tabs;
  final TabController? controller;

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      tabs: tabs.map((String e) => Tab(text: e)).toList(),
    );
  }
}
