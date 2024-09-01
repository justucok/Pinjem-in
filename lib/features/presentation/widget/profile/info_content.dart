import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class InfoAccountContent extends StatelessWidget {
  const InfoAccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: hintTextColor),
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        title: Text(
          'Pinjam.in',
          style: titleTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '''Pinjam.in adalah sebuah aplikasi yang memfasilitasi user dalam proses peminjaman ruangan dan mobil agar user lebih mudah, terstruktur dan efisien. Pinjam.in berfokus pada pencatatan proses peminjaman ruang, peminjaman mobil dan pengambilan atau pengembalian mobil untuk membantu pengurus atau pengelola dapat memonitoring dan mengelola mobil dan ruangan. Pinjam.in memiliki 2 versi yaitu dalam bentuk web base dan mobile.''',
          textAlign: TextAlign.justify,
          style: titleTextStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
