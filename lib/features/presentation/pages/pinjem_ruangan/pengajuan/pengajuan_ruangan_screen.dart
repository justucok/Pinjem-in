import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/features/presentation/bloc/post_pinjam_ruangan/post_pinjam_ruangan_bloc.dart';
import 'package:pinjem_in_app/features/presentation/pages/pinjem_ruangan/pengajuan/pengajuan_ruangan_confirm_screen.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_ruangan/pengajuan_ruangan/pengajuan_content.dart';
import 'package:pinjem_in_app/features/presentation/widget/status_nav_bar.dart';

class PengajuanRuanganScreen extends StatefulWidget {
  const PengajuanRuanganScreen({
    required this.selectedDate,
    super.key,
  });
  final DateTime selectedDate;

  @override
  State<PengajuanRuanganScreen> createState() => _PengajuanRuanganScreenState();
}

class _PengajuanRuanganScreenState extends State<PengajuanRuanganScreen> {
  final GlobalKey<FormState> reqKey = GlobalKey<FormState>();
  final TextEditingController acaraController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();
  final TextEditingController pesertaController = TextEditingController();
  late DateTime startTime = DateTime(24, 00);
  late DateTime endTime = DateTime(24, 00);
  late String? konsumsiValue;
  late String? ruanganValue;

  late int ruangan;
  late String konsum;

  @override
  Widget build(BuildContext context) {
    final formatStartTime = DateFormat('HH:mm').format(startTime);
    final formatEndTime = DateFormat('HH:mm').format(endTime);
    final startController = TextEditingController(
      text: formatStartTime,
    );
    final endController = TextEditingController(
      text: formatEndTime,
    );
    final postPinjamRuangan = PostPinjamRuanganBloc();

    log(formatStartTime);
    log(formatEndTime);
    log(widget.selectedDate.toString());

    return BlocProvider(
      create: (context) => postPinjamRuangan,
      child: BlocListener<PostPinjamRuanganBloc, PostPinjamRuanganState>(
        bloc: postPinjamRuangan,
        listener: (context, state) {
          if (state is PostPinjamRuanganSuccess) {
            Navigator.of(context).popAndPushNamed('/formSuccess');
          } else if (state is PostPinjamRuanganFailed) {
            Get.snackbar('Gagal', 'Gagal Melakukan Peminjaman Ruangan');
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(),
            ),
            body: Form(
              key: reqKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  StatusNavBar(
                    title1: 'Cek Tanggal',
                    title2: 'Pengajuan',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  PengajuanContent(
                    pickedStartTime: (DateTime newTime) {
                      setState(() => startTime = newTime);
                    },
                    pickedEndTime: (DateTime newTime) {
                      setState(() => endTime = newTime);
                    },
                    startTime: startTime,
                    endTime: endTime,
                    descController: descController,
                    acaraController: acaraController,
                    catatanController: catatanController,
                    pesertaController: pesertaController,
                    startController: startController,
                    endController: endController,
                    ruanganValue: (value) {
                      setState(() => ruanganValue = value);
                      if (ruanganValue == 'Bumble Bee') {
                        ruangan = 1;
                      } else if (ruanganValue == 'Optimus') {
                        ruangan = 2;
                      } else if (ruanganValue == 'Hound') {
                        ruangan = 3;
                      } else if (ruanganValue == 'Kuala Cafe') {
                        ruangan = 4;
                      }

                      log(ruanganValue!);
                      log(ruangan.toString());
                    },
                    konsumsiValue: (value) {
                      setState(() => konsumsiValue = value);
                      if (konsumsiValue == 'Ya') {
                        konsum = '1';
                      } else if (konsumsiValue == 'Tidak') {
                        konsum = '0';
                      }

                      log(konsumsiValue!);
                      log(konsum);
                    },
                    buttonPressed: () {
                      if (reqKey.currentState!.validate()) {
                        log('pass ${pesertaController.text}');
                        Navigator.of(context).push(
                          MaterialPageRoute<dynamic>(
                            builder: (context) => ConfirmFormScreen(
                              desc: descController,
                              event: acaraController,
                              note: catatanController,
                              timeStart: startController,
                              timeEnd: endController,
                              participant: pesertaController,
                              konsumsiValue: konsumsiValue!,
                              ruanganValue: ruanganValue!,
                              selectedDate: widget.selectedDate,
                              consumption: konsum,
                              room: ruangan,
                              postPinjamRuanganBloc: postPinjamRuangan,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
