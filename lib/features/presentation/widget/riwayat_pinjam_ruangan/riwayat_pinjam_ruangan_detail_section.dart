import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/notification/car_by_id/car_by_id_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/notification/room_by_id/room_by_id_bloc.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/detail_pengajuan_mobil/detail_data_desc.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_heading.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_title.dart';

class RiwayatPinjamRuanganDetailSection extends StatelessWidget {
  const RiwayatPinjamRuanganDetailSection({
    required this.tujuanAcara,
    required this.deskripsi,
    required this.tanggal,
    required this.penumpang,
    required this.sopir,
    required this.catatan,
    required this.status,
    super.key,
    this.mulai,
    this.selesai,
    this.confirmNote,
    this.roomId,
  });

  final String tujuanAcara;
  final String deskripsi;
  final String tanggal;
  final String? mulai;
  final String? selesai;
  final String penumpang;
  final String sopir;
  final String catatan;
  final String status;
  final String? confirmNote;
  final int? roomId;

  @override
  Widget build(BuildContext context) {
    final roomByIdBloc = RoomByIdBloc();
    final carByIdBloc = CarByIdBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => roomByIdBloc),
        BlocProvider(create: (context) => carByIdBloc),
      ],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PinjamMobilFormHeading(heading: 'Pinjaman'),
                const SizedBox(
                  height: 10,
                ),
                const PinjamMobilFormTitle(title: 'Acara'),
                const SizedBox(
                  height: 5,
                ),
                DetailDataDesc(desc: tujuanAcara),
                const SizedBox(
                  height: 7,
                ),
                const PinjamMobilFormTitle(title: 'Deskripsi'),
                const SizedBox(
                  height: 5,
                ),
                DetailDataDesc(desc: deskripsi),
                const SizedBox(
                  height: 13,
                ),
                const PinjamMobilFormHeading(
                  heading: 'Tanggal & Jam',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PinjamMobilFormTitle(title: 'Tanggal'),
                        const SizedBox(
                          height: 5,
                        ),
                        DetailDataDesc(desc: tanggal),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const PinjamMobilFormTitle(title: 'Mulai'),
                            const SizedBox(
                              height: 5,
                            ),
                            DetailDataDesc(desc: mulai!),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const PinjamMobilFormTitle(title: 'Selesai'),
                            const SizedBox(
                              height: 5,
                            ),
                            DetailDataDesc(desc: selesai!),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                const PinjamMobilFormHeading(
                  heading: 'Peserta & Konsumsi',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PinjamMobilFormTitle(
                          title: 'Peserta',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DetailDataDesc(desc: penumpang),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PinjamMobilFormTitle(
                          title: 'Konsumsi',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DetailDataDesc(desc: sopir),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PinjamMobilFormTitle(title: 'Catatan'),
                    const SizedBox(
                      height: 5,
                    ),
                    DetailDataDesc(desc: catatan),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                const PinjamMobilFormHeading(
                  heading: 'Status',
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PinjamMobilFormTitle(title: 'Status'),
                    const SizedBox(
                      height: 5,
                    ),
                    DetailDataDesc(desc: status),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PinjamMobilFormTitle(title: 'Catatan'),
                    const SizedBox(
                      height: 5,
                    ),
                    DetailDataDesc(
                      desc: confirmNote != null ? confirmNote! : '-',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: status == 'Diterima'
                ? BlocBuilder<RoomByIdBloc, RoomByIdState>(
                    bloc: roomByIdBloc..add(LoadRoomById(id: '$roomId')),
                    builder: (context, state) {
                      if (state is RoomByIdSuccess) {
                        final data = state.roomById;
                        log(data.picture);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              'http://s3.gmedia.id/training-project/products/bTbVPO5zZZxko9pQbyNAU5qDRTw1p4.jpg',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PinjamMobilFormTitle(title: data.name),
                                const SizedBox(
                                  height: 5,
                                ),
                                DetailDataDesc(
                                  desc: data.description,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PinjamMobilFormTitle(
                                  title: 'Kapasitas',
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                DetailDataDesc(
                                  desc: '${data.capacity} Orang',
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                : const Text(
                    'Data ruangan akan muncul jika permintaan peminjaman diterima',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
