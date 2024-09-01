import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_heading.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_title.dart';

class PinjamMobilFormDatePicker extends StatefulWidget {
  const PinjamMobilFormDatePicker({
    required this.tanggalController,
    required this.jamController,
    required this.pickedDate,
    required this.pickedTime,
    required this.dateTime,
    super.key,
  });

  final TextEditingController tanggalController;
  final TextEditingController jamController;
  final void Function(DateTime) pickedDate;
  final void Function(DateTime) pickedTime;
  final DateTime dateTime;

  @override
  State<PinjamMobilFormDatePicker> createState() =>
      _PinjamMobilFormDatePickerState();
}

class _PinjamMobilFormDatePickerState extends State<PinjamMobilFormDatePicker> {
  // DateTime dateTime = DateTime.now();
  // DateTime dateTime = DateTime.now();
  final timeValidate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    log(widget.tanggalController.text);
    log(widget.jamController.text);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PinjamMobilFormHeading(
          heading: 'Tanggal & Jam',
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PinjamMobilFormTitle(
                  title: 'Tanggal',
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: widget.tanggalController,
                    readOnly: true,
                    onTap: () {
                      // ignore: inference_failure_on_function_invocation
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: CupertinoDatePicker(
                            backgroundColor: Colors.white,
                            initialDateTime: widget.dateTime,
                            onDateTimeChanged: widget.pickedDate,
                            mode: CupertinoDatePickerMode.date,
                            // dateOrder: Locale(id_ID),
                          ),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      hintStyle: hintTextStyle.copyWith(fontSize: 14),
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                    validator: (value) {
                      if (widget.dateTime == timeValidate) {
                        return 'Tanggal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PinjamMobilFormTitle(
                  title: 'Jam',
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 110,
                  child: TextFormField(
                    controller: widget.jamController,
                    readOnly: true,
                    onTap: () {
                      // ignore: inference_failure_on_function_invocation
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: CupertinoDatePicker(
                            backgroundColor: Colors.white,
                            initialDateTime: widget.dateTime,
                            onDateTimeChanged: widget.pickedTime,
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: true,
                          ),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: DateFormat('HH.mm').format(DateTime.now()),
                      hintStyle: hintTextStyle.copyWith(fontSize: 14),
                      prefixIcon: const Icon(Icons.access_time_outlined),
                    ),
                    validator: (value) {
                      if (widget.dateTime == timeValidate) {
                        return 'Jam tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
