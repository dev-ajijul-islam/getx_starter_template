import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../presentation/widgets/common_text.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonText(text: title, fontSize: 28, fontWeight: FontWeight.w700),
        const SizedBox(height: 8),
        CommonText(text: subtitle, fontSize: 15, color: AppColors.grey),
      ],
    );
  }
}
