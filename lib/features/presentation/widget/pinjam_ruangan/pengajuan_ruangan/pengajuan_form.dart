import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/pengajuan_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_ruangan/pengajuan_ruangan/pengajuan_konsumsi_dropdown_menu.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_ruangan/pengajuan_ruangan/pengajuan_ruangan_dropdown_menu.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_ruangan/pengajuan_ruangan/pengajuan_timepicker.dart';

class PengajuanForm extends StatelessWidget {
  const PengajuanForm({
    required this.descController,
    required this.acaraController,
    required this.buttonPressed,
    required this.catatanController,
    required this.startController,
    required this.endController,
    required this.pickedStartTime,
    required this.pickedEndTime,
    required this.startTime,
    required this.endTime,
    // required this.pesertaValue,
    required this.konsumsiValue,
    required this.ruanganValue,
    required this.pesertaController,
    super.key,
  });

  final TextEditingController descController;
  final TextEditingController acaraController;
  final TextEditingController catatanController;
  final TextEditingController pesertaController;
  final dynamic Function() buttonPressed;
  final TextEditingController startController;
  final TextEditingController endController;
  final void Function(DateTime) pickedStartTime;
  final void Function(DateTime) pickedEndTime;
  final DateTime startTime;
  final DateTime endTime;
  // final void Function(String?) pesertaValue;
  final void Function(String?) konsumsiValue;
  final void Function(String?) ruanganValue;

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
        RuanganDropdown(
          ruanganValue: ruanganValue,
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
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: acaraController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'masukan tujuan anda',
            hintStyle: hintTextStyle.copyWith(fontSize: 14),
          ),
          validator: (acaraValue) {
            if (acaraValue!.isEmpty) {
              return 'Tujuan tidak boleh kosong!';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Deskripsi',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: descController,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 12,
              bottom: 81,
              left: 12,
              right: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'deskripsikan acara anda',
            hintStyle: hintTextStyle.copyWith(fontSize: 14),
          ),
          validator: (descValue) {
            if (descValue!.isEmpty) {
              return 'Deskripsi tidak boleh kosong!';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Jam',
          style: alternativeTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        PengajuanTimePicker(
          pickedEndTime: pickedEndTime,
          pickedStartTime: pickedStartTime,
          startController: startController,
          endController: endController,
          startTime: startTime,
          endTime: endTime,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Peserta & Konsumsi',
          style: alternativeTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        KonsumsiDropdown(
          pesertaController: pesertaController,
          // pesertaValue: pesertaValue,
          konsumsiValue: konsumsiValue,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Catatan',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: catatanController,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 12,
              bottom: 81,
              left: 12,
              right: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'masukan catatan terkait peserta dan konsumsi',
            hintStyle: hintTextStyle.copyWith(fontSize: 14),
          ),
          validator: (noteValue) {
            if (noteValue!.isEmpty) {
              return 'Catatan tidak boleh kosong!';
            } else {
              return null;
            }
          },
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
