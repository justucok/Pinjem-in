import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/bloc/pinjam_ruangan/pinjam_ruangan_bloc.dart';
import 'package:pinjem_in_app/features/presentation/pages/pinjem_ruangan/pengajuan/pengajuan_ruangan_screen.dart';
import 'package:pinjem_in_app/features/presentation/widget/cek_tanggal/calender.dart';
import 'package:pinjem_in_app/features/presentation/widget/cek_tanggal/list_event.dart';
import 'package:pinjem_in_app/features/presentation/widget/cek_tanggal/pengajuan_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/status_nav_bar.dart';

class CekTanggalScreen extends StatefulWidget {
  const CekTanggalScreen({super.key});

  @override
  State<CekTanggalScreen> createState() => _CekTanggalScreenState();
}

// final ValueNotifier<int> ruanganCurrentIndex = ValueNotifier(0);

class _CekTanggalScreenState extends State<CekTanggalScreen> {
  DateTime today = DateTime.now();
  final pinjamRuangan = PinjamRuanganBloc()..add(LoadPinjamRuangan());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => pinjamRuangan,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            children: [
              StatusNavBar(
                title1: 'Cek tanggal',
                title2: '',
                onTap: () {},
              ),
              Container(
                alignment: Alignment.center,
                height: 64,
                color: secondaryContainer,
                child: Text(
                  '''
Anda dapat melakukan pengajuan dengan memilih tanggal dan jam yang tersedia
                          ''',
                  style: textTextStyle.copyWith(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 637,
                child: BlocBuilder<PinjamRuanganBloc, PinjamRuanganState>(
                  bloc: pinjamRuangan,
                  builder: (context, state) {
                    if (state is PinjamRuanganSuccess) {
                      final data = state.pinjamRuanganData;
                      final spesific = data!.where((element) {
                        final res = element.status == 'Diterima';
                        return res;
                      }).toList();
                      return CalenderEvent(
                        today: today,
                        eventLoader: (day) {
                          final filteredEvents = spesific
                              .where(
                                (e) =>
                                    e.date ==
                                    DateFormat('yyyy-MM-dd').format(day),
                              )
                              .toList();
                          return filteredEvents;
                        },
                        selectedDay: (DateTime day, DateTime focusedDay) {
                          setState(() {
                            today = day;
                          });
                          final filteredEvents = spesific
                              .where(
                                (e) =>
                                    e.date ==
                                    DateFormat('yyyy-MM-dd').format(today),
                              )
                              .toList();
                          log(filteredEvents.toString());
                          Intl.defaultLocale = 'id_ID';
                          final formatCekTanggal =
                              DateFormat('EEEE, dd MMMM yyyy').format(today);
                          showDialog<String>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  formatCekTanggal,
                                  style: titleTextStyle.copyWith(fontSize: 20),
                                ),
                                content: SizedBox(
                                  width: 271,
                                  height: 400,
                                  child: Column(
                                    children: [
                                      const Divider(),
                                      if (filteredEvents.isNotEmpty)
                                        ListView.builder(
                                          padding: const EdgeInsets.all(4),
                                          shrinkWrap: true,
                                          itemCount: filteredEvents.length,
                                          itemBuilder: (context, index) {
                                            final e = filteredEvents[index];
                                            log(e.date);
                                            return Column(
                                              children: [
                                                CardEvent(
                                                  event: e.event,
                                                  timeStart: e.timeStart,
                                                  timeEnd: e.timeEnd,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            );
                                          },
                                        )
                                      else
                                        Text(
                                          '''Saat ini belum ada pinjaman, dapat melakukan pinjaman dengan klik tombol dibawah''',
                                          style: textTextStyle.copyWith(
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  PengajuanButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute<dynamic>(
                                          builder: (context) =>
                                              PengajuanRuanganScreen(
                                            selectedDate: today,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    } else if (state is PinjamRuanganLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: secondaryTextColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Gagal menampilkan Kalender',
                          style: textTextStyle,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
