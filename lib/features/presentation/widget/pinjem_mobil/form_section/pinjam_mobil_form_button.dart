import 'package:flutter/material.dart';

import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class PinjamMobilFormButton extends StatelessWidget {
  const PinjamMobilFormButton({
    required this.btnText,
    super.key,
    this.onPressed,
  });

  final String btnText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Batal',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 55),
              maximumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              backgroundColor: primaryButtonColor,
            ),
            child: Text(
              btnText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
