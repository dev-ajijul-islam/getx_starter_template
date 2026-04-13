import 'package:flutter/material.dart';

import 'common_text.dart';

class CommonEmpty extends StatelessWidget {
  const CommonEmpty({required this.title, super.key, this.subtitle, this.icon});

  final String title;
  final String? subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon ?? Icons.inbox_outlined, size: 48),
          const SizedBox(height: 12),
          CommonText(text: title, fontSize: 18, fontWeight: FontWeight.w600),
          if (subtitle != null) ...<Widget>[
            const SizedBox(height: 6),
            CommonText(text: subtitle!),
          ],
        ],
      ),
    );
  }
}
