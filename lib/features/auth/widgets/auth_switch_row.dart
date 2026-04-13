import 'package:flutter/material.dart';

class AuthSwitchRow extends StatelessWidget {
  const AuthSwitchRow({
    required this.question,
    required this.actionText,
    required this.onTap,
    super.key,
  });

  final String question;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(question),
        TextButton(onPressed: onTap, child: Text(actionText)),
      ],
    );
  }
}
