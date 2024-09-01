import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/features/pinjam_ruangan/data/body/pinjam_ruangan_body.dart';
import 'package:pinjem_in_app/features/presentation/bloc/post_pinjam_ruangan/post_pinjam_ruangan_bloc.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/progress_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_ruangan/detail_ruangan/confirm_content.dart';
import 'package:pinjem_in_app/features/presentation/widget/status_nav_bar.dart';

class ConfirmFormScreen extends StatelessWidget {
  const ConfirmFormScreen({
    required this.desc,
    required this.event,
    required this.note,
    required this.timeStart,
    required this.timeEnd,
    required this.konsumsiValue,
    required this.ruanganValue,
    required this.selectedDate,
    required this.participant,
    required this.consumption,
    required this.room,
    required this.postPinjamRuanganBloc,
    super.key,
  });

  final TextEditingController desc;
  final TextEditingController event;
  final TextEditingController note;
  final TextEditingController timeStart;
  final TextEditingController timeEnd;
  final TextEditingController participant;
  final DateTime selectedDate;
  final String konsumsiValue;
  final String consumption;
  final String ruanganValue;
  final int room;
  final PostPinjamRuanganBloc postPinjamRuanganBloc;

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('yyyy-MM-dd').format(selectedDate);
    final person = int.parse(participant.text);
    log('date $date');
    log('start ${timeStart.text}');
    log('end ${timeEnd.text}');
    log('person $person');
    log('room id $room');
    log('event ${event.text}');
    log('desc ${desc.text}');
    log('note ${note.text}');
    log('konsum $consumption');
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            StatusNavBar(
              title1: 'Cek Tanggal',
              title2: 'Pengajuan',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const ProgressBar(
              fullColor: true,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ConfirmContent(
                ruanganValue: ruanganValue,
                acaraController: event,
                descController: desc,
                startController: timeStart,
                endController: timeEnd,
                pesertaController: participant,
                konsumsiValue: konsumsiValue,
                selectedDate: selectedDate,
                catatanController: note,
                buttonPressed: () {
                  postPinjamRuanganBloc.add(
                    PostDataPinjamRuangan(
                      body: PinjamRuanganBody(
                        room_id: room,
                        date: date,
                        time_start: timeStart.text,
                        time_end: timeEnd.text,
                        event: event.text,
                        description: desc.text,
                        participant: person,
                        consumption: consumption,
                        note: note.text,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
