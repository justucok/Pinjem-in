import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class ReqButton extends StatelessWidget {
  const ReqButton({
    required this.buttonPressed,
    super.key,
  });

  final dynamic Function() buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Batal',
            style: secondaryButtonTextStyle.copyWith(fontSize: 14),
          ),
        ),
        ElevatedButton(
          onPressed: buttonPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(141),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            backgroundColor: primaryButtonColor,
          ),
          child: Text(
            'Selanjutnya',
            style: buttonTextStyle.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
