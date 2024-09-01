import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class ConfirmTimePicker extends StatelessWidget {
  const ConfirmTimePicker({
    // required this.dateController,
    required this.startController,
    required this.endController,
    required this.selectedDate,
    super.key,
  });

  // final TextEditingController dateController;
  final TextEditingController startController;
  final TextEditingController endController;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    final formatSelectedDate = DateFormat('d MMMM y').format(selectedDate);
    log('out: ${startController.text}');
    log('out: ${endController.text}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            Text(
              formatSelectedDate,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mulai',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            Text(
              startController.text,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selesai',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            Text(
              endController.text,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
