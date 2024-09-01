import 'package:flutter/material.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/detail_pengajuan_mobil/detail_data_desc.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_heading.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_title.dart';

class DetailPinjamRuanganLoading extends StatelessWidget {
  const DetailPinjamRuanganLoading({required this.status, super.key});
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredBox(
                color: Colors.black,
                child: PinjamMobilFormHeading(heading: 'Pinjaman'),
              ),
              ColoredBox(
                color: Colors.black,
                child: SizedBox(
                  height: 10,
                ),
              ),
              ColoredBox(
                color: Colors.black,
                child: PinjamMobilFormTitle(title: 'Acara'),
              ),
              SizedBox(
                height: 5,
              ),
              ColoredBox(
                color: Colors.black,
                child: DetailDataDesc(desc: 'Acaraaaaa'),
              ),
              SizedBox(
                height: 7,
              ),
              ColoredBox(
                color: Colors.black,
                child: PinjamMobilFormTitle(title: 'Deskripsi'),
              ),
              SizedBox(
                height: 5,
              ),
              ColoredBox(
                color: Colors.black,
                child: DetailDataDesc(desc: 'Description'),
              ),
              SizedBox(
                height: 13,
              ),
              ColoredBox(
                color: Colors.black,
                child: PinjamMobilFormHeading(
                  heading: 'Tanggal & Jam',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColoredBox(
                        color: Colors.black,
                        child: PinjamMobilFormTitle(title: 'Tanggal'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ColoredBox(
                        color: Colors.black,
                        child: DetailDataDesc(desc: 'Tanggal'),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColoredBox(
                            color: Colors.black,
                            child: PinjamMobilFormTitle(title: 'Mulai'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ColoredBox(
                            color: Colors.black,
                            child: DetailDataDesc(desc: 'Mulaii'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColoredBox(
                            color: Colors.black,
                            child: PinjamMobilFormTitle(title: 'Selesai'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ColoredBox(
                            color: Colors.black,
                            child: DetailDataDesc(desc: 'Selesaaiii'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              ColoredBox(
                color: Colors.black,
                child: PinjamMobilFormHeading(
                  heading: 'Peserta & Konsumsi',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColoredBox(
                        color: Colors.black,
                        child: PinjamMobilFormTitle(
                          title: 'Peserta',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ColoredBox(
                        color: Colors.black,
                        child: DetailDataDesc(desc: 'Penumpang'),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColoredBox(
                        color: Colors.black,
                        child: PinjamMobilFormTitle(
                          title: 'Konsumsi',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ColoredBox(
                        color: Colors.black,
                        child: DetailDataDesc(desc: 'Konsumsiii'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColoredBox(
                    color: Colors.black,
                    child: PinjamMobilFormTitle(title: 'Catatan'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ColoredBox(
                    color: Colors.black,
                    child: DetailDataDesc(desc: 'Catataann'),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              ColoredBox(
                color: Colors.black,
                child: PinjamMobilFormHeading(
                  heading: 'Status',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColoredBox(
                    color: Colors.black,
                    child: PinjamMobilFormTitle(title: 'Status'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ColoredBox(
                    color: Colors.black,
                    child: DetailDataDesc(desc: 'Statuss'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColoredBox(
                    color: Colors.black,
                    child: PinjamMobilFormTitle(title: 'Catatan'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ColoredBox(
                    color: Colors.black,
                    child: DetailDataDesc(
                      desc: '-',
                    ),
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
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColoredBox(
                      color: Colors.black,
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColoredBox(
                          color: Colors.black,
                          child: PinjamMobilFormTitle(title: 'Room Name'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ColoredBox(
                          color: Colors.black,
                          child: DetailDataDesc(
                            desc: 'Room Desc',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColoredBox(
                          color: Colors.black,
                          child: PinjamMobilFormTitle(
                            title: 'Kapasitas',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ColoredBox(
                          color: Colors.black,
                          child: DetailDataDesc(
                            desc: 'Room Capacity',
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : const ColoredBox(
                  color: Colors.black,
                  child: Text(
                    'Data ruangan akan muncul jika permintaan peminjaman diterima',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
