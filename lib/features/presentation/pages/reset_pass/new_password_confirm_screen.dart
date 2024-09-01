import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/widget/auth_header.dart';
import 'package:pinjem_in_app/features/presentation/widget/login/login_button.dart';

class NewPasswordConfirmScreen extends StatelessWidget {
  const NewPasswordConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const AuthHeader(),
              const SizedBox(
                height: 10,
              ),
              Image.asset('lib/app/assets/lock-alt.png'),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sukses Ubah Password',
                style: textTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Password berhasil diubah, silahkan masuk kembali',
                style: secondaryTextStyle.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
