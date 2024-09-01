// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/assets/line.dart';
import 'package:pinjem_in_app/app/assets/progress_1.dart';
import 'package:pinjem_in_app/app/assets/progress_2.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.fullColor,
    super.key,
  });
  final bool fullColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Num1(),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                'Pengajuan',
                textAlign: TextAlign.center,
                style: progressTextStyle.copyWith(fontSize: 13),
              ),
            ),
          ],
        ),
        const ProgressLine(),
        Column(
          children: [
            Num2(fullColor: fullColor),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                'Detail',
                textAlign: TextAlign.center,
                style: progressTextStyle.copyWith(fontSize: 13),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
