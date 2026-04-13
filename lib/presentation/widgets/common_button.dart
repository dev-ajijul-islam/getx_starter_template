import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    required this.text,
    required this.onTap,
    super.key,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
  });

  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor:  backgroundColor ?? AppColors.primary,
        foregroundColor: foregroundColor ?? AppColors.white,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (icon != null) ...<Widget>[icon!, const SizedBox(width: 8)],
                Text(text),
              ],
            ),
    );
  }
}
