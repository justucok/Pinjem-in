// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class RiwayatPinjamRuanganLoading extends StatelessWidget {
  const RiwayatPinjamRuanganLoading({
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
          ColoredBox(
            color: Colors.black,
            child: Text(
              ruangan,
              style: homePinjamTitleStyle.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColoredBox(
                color: Colors.black,
                child: Row(
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
              ),
              Container(
                height: 27,
                width: 92,
                decoration: BoxDecoration(
                  color: const Color(0xffE5E5E5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ColoredBox(
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              ColoredBox(
                color: Colors.black,
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: Color(0xff2B9FDC),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('hh:mm a'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
