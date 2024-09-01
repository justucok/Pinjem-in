import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/pengajuan_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_ruangan/detail_ruangan/confirm_dropdown_peserta.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_ruangan/detail_ruangan/confirm_timepicker.dart';

class ConfirmContent extends StatelessWidget {
  const ConfirmContent({
    required this.ruanganValue,
    required this.acaraController,
    required this.descController,
    required this.startController,
    required this.endController,
    required this.konsumsiValue,
    required this.catatanController,
    required this.buttonPressed,
    required this.selectedDate,
    required this.pesertaController,
    super.key,
  });

  final String ruanganValue;
  final TextEditingController acaraController;
  final TextEditingController descController;
  final TextEditingController startController;
  final TextEditingController endController;
  final String konsumsiValue;
  final DateTime selectedDate;
  final TextEditingController catatanController;
  final TextEditingController pesertaController;
  final dynamic Function() buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ruangan',
          style: alternativeTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Ruangan',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        Text(
          ruanganValue,
          style: secondaryTextStyle.copyWith(fontSize: 13),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Pinjaman',
          style: alternativeTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Acara',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        Text(
          acaraController.text,
          style: secondaryTextStyle.copyWith(fontSize: 13),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Deskipsi',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        Text(
          descController.text,
          style: secondaryTextStyle.copyWith(fontSize: 13),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Tanggal & Jam',
          style: alternativeTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        ConfirmTimePicker(
          // dateController: dateController,
          startController: startController,
          endController: endController,
          selectedDate: selectedDate,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Peserta & Konsumsi',
          style: alternativeTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        ConfirmDropdown(
          pesertaController: pesertaController,
          // pesertaValue: pesertaValue,
          konsumsiValue: konsumsiValue,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Catatan',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        Text(
          catatanController.text,
          style: secondaryTextStyle.copyWith(fontSize: 13),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(),
        const SizedBox(
          height: 16,
        ),
        ReqButton(
          buttonPressed: buttonPressed,
        ),
      ],
    );
  }
}
