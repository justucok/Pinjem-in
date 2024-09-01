import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({
    required this.onPressed,
    super.key,
  });

  final dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Belum punya akun ?',
          style: textTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          width: 16,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Daftar',
            style: linkTextStyle.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
