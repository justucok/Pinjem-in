import 'package:flutter/material.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/progress_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_ruangan/pengajuan_ruangan/pengajuan_form.dart';

class PengajuanContent extends StatelessWidget {
  const PengajuanContent({
    required this.descController,
    required this.acaraController,
    required this.catatanController,
    required this.buttonPressed,
    required this.startTime,
    required this.endTime,
    required this.pickedStartTime,
    required this.pickedEndTime,
    required this.startController,
    required this.endController,
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
      children: [
        const ProgressBar(
          fullColor: false,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: PengajuanForm(
            pickedStartTime: pickedStartTime,
            pickedEndTime: pickedEndTime,
            buttonPressed: buttonPressed,
            descController: descController,
            acaraController: acaraController,
            catatanController: catatanController,
            startTime: startTime,
            endTime: endTime,
            startController: startController,
            endController: endController,
            // pesertaValue: pesertaValue,
            konsumsiValue: konsumsiValue,
            ruanganValue: ruanganValue,
            pesertaController: pesertaController,
          ),
        ),
      ],
    );
  }
}
