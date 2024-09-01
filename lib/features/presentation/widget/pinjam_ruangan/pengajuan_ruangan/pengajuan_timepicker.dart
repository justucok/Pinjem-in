// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class PengajuanTimePicker extends StatefulWidget {
  const PengajuanTimePicker({
    required this.startController,
    required this.endController,
    required this.pickedStartTime,
    required this.pickedEndTime,
    required this.startTime,
    required this.endTime,
    super.key,
  });

  final TextEditingController startController;
  final TextEditingController endController;
  final void Function(DateTime) pickedStartTime;
  final void Function(DateTime) pickedEndTime;
  final DateTime startTime;
  final DateTime endTime;

  @override
  State<PengajuanTimePicker> createState() => _PengajuanTimePickerState();
}

class _PengajuanTimePickerState extends State<PengajuanTimePicker> {
  @override
  Widget build(BuildContext context) {
    final timeValidate = DateTime(24, 00);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Mulai',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              width: 110,
              child: TextFormField(
                readOnly: true,
                controller: widget.startController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  prefixIcon: Icon(
                    Icons.access_time,
                    color: textColor,
                    size: 20,
                  ),
                ),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        initialDateTime: widget.startTime,
                        onDateTimeChanged: widget.pickedStartTime,
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.time,
                      ),
                    ),
                  );
                },
                validator: (value) {
                  if (widget.startTime == timeValidate) {
                    return 'Waktu tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Selesai',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              width: 110,
              child: TextFormField(
                readOnly: true,
                controller: widget.endController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  prefixIcon: Icon(
                    Icons.access_time,
                    color: textColor,
                    size: 20,
                  ),
                ),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        initialDateTime: widget.endTime,
                        onDateTimeChanged: widget.pickedEndTime,
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.time,
                      ),
                    ),
                  );
                },
                validator: (value) {
                  if (widget.endTime == timeValidate) {
                    return 'Waktu tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
