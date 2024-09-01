import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/features/presentation/cubit/hide_pass/hide_pass_cubit.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/profile/change_pass_content.dart';
import 'package:pinjem_in_app/features/presentation/widget/status_nav_bar.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obsecureText = HidePassCubit();
    return BlocProvider(
      create: (context) => obsecureText,
      child: SafeArea(
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
                ChangePassContent(
                  hidePassCubit: obsecureText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
