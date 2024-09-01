// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/detail_pengajuan_mobil/detail_data_desc.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_heading.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_title.dart';

class DetailDataSection extends StatelessWidget {
  const DetailDataSection({
    required this.tujuan,
    required this.deskripsi,
    required this.tanggal,
    required this.jam,
    required this.penumpang,
    required this.sopir,
    required this.catatan,
    required this.onPressed,
    super.key,
  });
  final String tujuan;
  final String deskripsi;
  final String tanggal;
  final String jam;
  final String penumpang;
  final String sopir;
  final String catatan;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PinjamMobilFormHeading(
            heading: 'Pinjaman',
          ),
          const SizedBox(
            height: 10,
          ),
          const PinjamMobilFormTitle(title: 'Tujuan'),
          const SizedBox(
            height: 5,
          ),
          DetailDataDesc(desc: tujuan),
          const SizedBox(
            height: 10,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PinjamMobilFormTitle(title: 'Jam'),
                  const SizedBox(
                    height: 5,
                  ),
                  DetailDataDesc(desc: jam),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          const PinjamMobilFormHeading(
            heading: 'Penummpang & Sopir',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PinjamMobilFormTitle(title: 'Penumpang'),
                  const SizedBox(
                    height: 5,
                  ),
                  DetailDataDesc(desc: '$penumpang Orang  '),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PinjamMobilFormTitle(title: 'Supir'),
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
          const PinjamMobilFormTitle(title: 'Catatan'),
          const SizedBox(
            height: 5,
          ),
          DetailDataDesc(desc: catatan),
          const SizedBox(
            height: 13,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1.5,
          ),
          const SizedBox(
            height: 10,
          ),
          PinjamMobilFormButton(
            btnText: 'Kirim',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
