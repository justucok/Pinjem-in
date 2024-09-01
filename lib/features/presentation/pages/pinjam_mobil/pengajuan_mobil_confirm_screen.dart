import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/features/pinjam_mobil/data/body/pinjam_mobil_body.dart';
import 'package:pinjem_in_app/features/presentation/bloc/post_pinjam_mobil/post_pinjam_mobil_bloc.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/progress_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/detail_pengajuan_mobil/detail_data_section.dart';
import 'package:pinjem_in_app/features/presentation/widget/status_nav_bar.dart';

class DetailPengajuanMobil extends StatelessWidget {
  const DetailPengajuanMobil({
    required this.tujuan,
    required this.deskripsi,
    required this.tanggal,
    required this.jam,
    required this.penumpang,
    required this.sopir,
    required this.catatan,
    required this.postPinjamMobilBloc,
    super.key,
  });

  final String tujuan;
  final String deskripsi;
  final String tanggal;
  final String jam;
  final String penumpang;
  final String sopir;
  final String catatan;
  final PostPinjamMobilBloc postPinjamMobilBloc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  StatusNavBar(
                    onTap: () {},
                    title1: 'Pengajuan',
                    title2: '',
                  ),
                  const ProgressBar(
                    fullColor: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DetailDataSection(
                    tujuan: tujuan,
                    deskripsi: deskripsi,
                    tanggal: DateFormat('dd MMMM yyyy').format(
                      DateTime.parse(tanggal),
                    ),
                    jam: jam,
                    penumpang: penumpang,
                    sopir: sopir,
                    catatan: catatan,
                    onPressed: () {
                      postPinjamMobilBloc.add(
                        PostDataPinjamMobil(
                          body: PinjamMobilBody(
                            destination: tujuan,
                            description: deskripsi,
                            date: tanggal,
                            time: jam,
                            passanger: int.tryParse(penumpang)!,
                            driver: sopir,
                            passangerDescription: catatan,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
