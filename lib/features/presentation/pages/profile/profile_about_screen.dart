import 'package:flutter/material.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/profile/info_content.dart';
import 'package:pinjem_in_app/features/presentation/widget/status_nav_bar.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              StatusNavBar(
                onTap: () {},
                title1: 'Akun',
                title2: '',
              ),
              // const ProfileMenuButton(),
              const SizedBox(
                height: 40,
              ),
              const InfoAccountContent(),
            ],
          ),
        ),
      ),
    );
  }
}
