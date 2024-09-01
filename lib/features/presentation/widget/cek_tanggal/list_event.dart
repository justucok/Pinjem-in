import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({
    // required this.date,
    required this.event,
    required this.timeStart,
    required this.timeEnd,
    super.key,
  });

  // final String date;
  final String event;
  final String timeStart;
  final String timeEnd;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: primaryContainer.withOpacity(0.30),
      title: Text(
        event,
        style: textTextStyle.copyWith(fontSize: 12),
      ),
      subtitle: Text(
        '$timeStart - $timeEnd',
        style: textTextStyle.copyWith(fontSize: 11),
      ),
    );
  }
}
