// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RiwayatPinjamRuanganBreadcrumbs extends StatelessWidget {
  const RiwayatPinjamRuanganBreadcrumbs({
    required this.riwayatDetail,
    super.key,
  });

  final bool riwayatDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Home',
          style: TextStyle(
            color: Color(0xffB2B2B2),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon(Icons.keyboard_arrow_right_sharp),
        const SizedBox(
          width: 5,
        ),
        if (!riwayatDetail)
          const Text(
            'Riwayat',
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        else
          const Row(
            children: [
              Text(
                'Riwayat',
                style: TextStyle(
                  color: Color(0xffB2B2B2),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.keyboard_arrow_right_sharp),
              SizedBox(
                width: 5,
              ),
              Text(
                'Detail',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
