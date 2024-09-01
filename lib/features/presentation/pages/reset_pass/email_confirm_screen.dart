import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/widget/auth_header.dart';

class EmailConfirmScreen extends StatelessWidget {
  const EmailConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/newPass');
          },
          child: Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                const AuthHeader(),
                const SizedBox(
                  height: 10,
                ),
                Image.asset('lib/app/assets/mail-send-line.png'),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Verifikasi dikirim',
                  style: textTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Cek emailmu sekarang untuk melakukan reset password',
                  style: secondaryTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
