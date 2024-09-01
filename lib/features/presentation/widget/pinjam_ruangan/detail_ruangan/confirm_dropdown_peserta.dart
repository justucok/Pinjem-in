import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class ConfirmDropdown extends StatelessWidget {
  const ConfirmDropdown({
    // required this.pesertaValue,
    required this.konsumsiValue,
    required this.pesertaController, super.key,
  });

  // final String pesertaValue;
  final String konsumsiValue;
  final TextEditingController pesertaController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Peserta',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            Text(
              pesertaController.text,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Konsumsi',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            Text(
              konsumsiValue,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
