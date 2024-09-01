import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    required this.onPressed,
    super.key,
  });

  final dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        maximumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: primaryButtonColor,
      ),
      onPressed: onPressed,
      child: Text(
        'Kirim',
        style: buttonTextStyle.copyWith(fontSize: 16),
      ),
    );
  }
}
