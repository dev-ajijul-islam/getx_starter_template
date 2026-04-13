import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../presentation/widgets/common_button.dart';
import '../../controllers/onboarding_controller.dart';
import '../../widgets/onboarding_item.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.complete,
                  child: const Text(AppStrings.skip),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.pages.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (_, int index) => OnboardingItem(item: controller.pages[index]),
                ),
              ),
              SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.pages.length,
                effect: WormEffect(
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.border,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(
                  () => CommonButton(
                    text: controller.currentIndex.value == controller.pages.length - 1
                        ? AppStrings.getStarted
                        : AppStrings.next,
                    onTap: controller.next,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
