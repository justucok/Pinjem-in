// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class RiwayatPinjamRuanganSection extends StatelessWidget {
  const RiwayatPinjamRuanganSection({
    required this.ruangan,
    required this.tanggal,
    required this.status,
    required this.jam,
    super.key,
  });

  final String ruangan;
  final String tanggal;
  final String status;
  final String jam;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ruangan,
            style: homePinjamTitleStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xff2B9FDC),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(tanggal),
                ],
              ),
              if (status == 'Dicek')
                Container(
                  height: 27,
                  width: 92,
                  decoration: BoxDecoration(
                    color: const Color(0xffE5E5E5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                )
              else if (status == 'Diterima')
                Container(
                  height: 27,
                  width: 92,
                  decoration: BoxDecoration(
                    color: const Color(0xffDCFFDC),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Color(0xff008000),
                      ),
                    ),
                  ),
                )
              else if (status == 'Ditolak')
                Container(
                  height: 27,
                  width: 92,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFD1D1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Color(0xffD80000),
                      ),
                    ),
                  ),
                )
              else if (status == 'Digunakan')
                Container(
                  height: 27,
                  width: 92,
                  decoration: BoxDecoration(
                    color: const Color(0xffFDEDCA),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Color(0xffE26B00),
                      ),
                    ),
                  ),
                )
              else
                Container(
                  height: 27,
                  width: 92,
                  decoration: BoxDecoration(
                    color: const Color(0xffC1E9FF),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Color(0xff2B9FDC),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                color: Color(0xff2B9FDC),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(jam),
            ],
          ),
        ],
      ),
    );
  }
}
