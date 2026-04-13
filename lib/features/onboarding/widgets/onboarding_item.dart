import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../presentation/widgets/common_text.dart';
import '../controllers/onboarding_controller.dart';


class OnboardingItem extends StatelessWidget {
  const OnboardingItem({required this.item, super.key});

  final OnboardingPageModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, size: 90, color: AppColors.primary),
          ),
          const SizedBox(height: 36),
          CommonText(
            text: item.title,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          CommonText(
            text: item.subtitle,
            fontSize: 16,
            color: AppColors.grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
