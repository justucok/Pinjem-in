import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/success_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(),
        ),
        body: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 48,
              ),
              Image.asset('lib/app/assets/check.png'),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''
Request sudah dikirimi, mohon ditunggu updatenya
''',
                style: secondaryTextStyle.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SuccessButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
