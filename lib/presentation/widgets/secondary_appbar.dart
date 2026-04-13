import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAppbar({required this.title, super.key, this.onBack});

  final String title;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onBack ?? Get.back,
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(title),
    );
  }
}
