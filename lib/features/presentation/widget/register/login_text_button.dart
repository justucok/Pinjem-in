import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({required this.onPressed, super.key});

  final dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sudah Punya Akun ?',
          style: textTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          width: 16,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Masuk',
            style: linkTextStyle.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
