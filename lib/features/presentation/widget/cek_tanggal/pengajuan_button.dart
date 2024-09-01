import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class PengajuanButton extends StatelessWidget {
  const PengajuanButton({
    required this.onPressed,
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'Pengajuan Ruangan',
          style: buttonTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
