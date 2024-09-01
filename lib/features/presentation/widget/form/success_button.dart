import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class SuccessButton extends StatelessWidget {
  const SuccessButton({
    required this.onPressed,
    super.key,
  });

  final dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(133),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        backgroundColor: primaryButtonColor,
      ),
      child: Text(
        'Kembali',
        style: buttonTextStyle.copyWith(fontSize: 16),
      ),
    );
  }
}
