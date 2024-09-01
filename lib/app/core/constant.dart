import 'package:flutter/material.dart';

class FormKey {
  final GlobalKey<FormState> logKey = GlobalKey<FormState>();
  final GlobalKey<FormState> regKey = GlobalKey<FormState>();
}

class Constants {
  static const dummmyUrl = 'https://646723acba7110b663b05488.mockapi.io/';
  static const baseUrl = 'https://api.pinjamin.appmedia.id/';

  static final items = <String>[
    'Harian',
    'Mingguan',
    'Bulanan',
  ];

  static final filterPinjaman = <String>[
    'Semua',
    'Dicek',
    'Ditolak',
    'Diterima',
    'Digunakan',
    'Selesai',
  ];

  static final profileMenu = <String>[
    'Log Out',
    'Akun',
    'Ganti Password',
    'Information',
  ];

  static final profileMenuIcon = <IconData>[
    Icons.logout,
    Icons.person,
    Icons.lock,
    Icons.info_rounded,
  ];
}
