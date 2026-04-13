import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/storage_service.dart';
import '../../../routes/app_routes.dart';

class OnboardingPageModel {
  const OnboardingPageModel({required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;
}

class OnboardingController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final PageController pageController = PageController();

  final List<OnboardingPageModel> pages = const <OnboardingPageModel>[
    OnboardingPageModel(
      title: 'Build faster',
      subtitle: 'Reusable widgets, routing, themes and starter architecture are ready.',
      icon: Icons.rocket_launch_rounded,
    ),
    OnboardingPageModel(
      title: 'Scale cleaner',
      subtitle: 'Separate features, data, core and presentation layers with GetX binding.',
      icon: Icons.layers_rounded,
    ),
    OnboardingPageModel(
      title: 'Ship confidently',
      subtitle: 'Start auth, dashboard and API integration from a clean baseline.',
      icon: Icons.verified_rounded,
    ),
  ];

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  Future<void> next() async {
    if (currentIndex.value == pages.length - 1) {
      await complete();
      return;
    }
    await pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> complete() async {
    await StorageService.saveBool('has_seen_onboarding', true);
    await Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
