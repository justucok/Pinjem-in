import 'package:flutter/material.dart';
import 'package:pinjem_in_app/features/presentation/pages/home/home_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/login/login_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/notifikasi/notification_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/pinjam_mobil/pengajuan_mobil_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/pinjam_mobil/pinjam_mobil_success_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/pinjem_ruangan/cek_tanggal/cek_tanggal_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/profile/profile_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/register/register_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/reset_pass/create_new_password_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/reset_pass/email_confirm_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/reset_pass/new_password_confirm_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/reset_pass/reset_pass_screen.dart';
import 'package:pinjem_in_app/features/presentation/pages/riwayat_pinjam_ruangan/riwayat_pinjam_ruangan_screen.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/form_success_screen.dart';

class MyRoutes {
  Route<String> onRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      case '/home':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/profile':
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      case '/reg':
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );

      case '/reset':
        return MaterialPageRoute(
          builder: (context) => ResetPassScreen(),
        );

      case '/emailConfirm':
        return MaterialPageRoute(
          builder: (context) => const EmailConfirmScreen(),
        );

      case '/newPass':
        return MaterialPageRoute(
          builder: (context) => CreateNewPasswordScreen(),
        );

      case '/newPassSucc':
        return MaterialPageRoute(
          builder: (context) => const NewPasswordConfirmScreen(),
        );

      case '/pinjamMobil':
        return MaterialPageRoute(
          builder: (context) => const PengajuanMobilScreen(),
        );

      case '/riwayatPinjamRuangan':
        return MaterialPageRoute(
          builder: (context) => const RiwayatPinjamRuanganScreen(),
        );

      case '/pinjamMobilSuccess':
        return MaterialPageRoute(
          builder: (context) => const PinjamMobilSuccessScreen(),
        );

      case '/cekTanggal':
        return MaterialPageRoute(
          builder: (context) => const CekTanggalScreen(),
        );

      case '/formSuccess':
        return MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
        );

      case '/notification':
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );

      default:
        throw Exception('Invalid route');
    }
  }
}
