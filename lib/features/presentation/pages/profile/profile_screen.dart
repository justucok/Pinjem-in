import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/profile/bloc/get_user_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/user_id_pref/user_id_pref_bloc.dart';
import 'package:pinjem_in_app/features/presentation/cubit/hide_pass/hide_pass_cubit.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/profile/account_content.dart';
import 'package:pinjem_in_app/features/presentation/widget/profile/change_pass_content.dart';
import 'package:pinjem_in_app/features/presentation/widget/profile/info_content.dart';
import 'package:pinjem_in_app/features/presentation/widget/profile/profile_menu_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/status_nav_bar.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = GetUserBloc();
    final userIdBloc = UserIdPrefBloc()..add(LoadUserIdPref());
    final obsecureText = HidePassCubit();
    final profileMenuIndex = ValueNotifier<int>(1);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => userBloc),
        BlocProvider(create: (context) => obsecureText),
        BlocProvider(
          create: (context) => userIdBloc,
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                StatusNavBar(
                  title1: 'Akun',
                  title2: '',
                  onTap: () {},
                ),
                ProfileMenuButton(
                  profileMenuIndex: profileMenuIndex,
                ),
                const SizedBox(
                  height: 40,
                ),
                ValueListenableBuilder(
                  valueListenable: profileMenuIndex,
                  builder: (context, value, child) {
                    if (value == 1) {
                      return BlocBuilder<UserIdPrefBloc, UserIdPrefState>(
                        bloc: userIdBloc,
                        builder: (context, state) {
                          if (state is UserIdPrefAvailable) {
                            final id = state.userId;
                            log('ID: $id');

                            return BlocBuilder<GetUserBloc, GetUserState>(
                              bloc: userBloc..add(LoadUserData(id: id)),
                              builder: (context, state) {
                                if (state is GetUserLoaded) {
                                  final data = state.users;
                                  if (data != null) {
                                    return AccountContent(
                                      usernameController: TextEditingController(
                                        text: data.name,
                                      ),
                                      emailController: TextEditingController(
                                        text: data.email,
                                      ),
                                      phoneController: TextEditingController(
                                        text: data.phone,
                                      ),
                                      divisiController: TextEditingController(
                                        text: data.division,
                                      ),
                                    );
                                  } else {
                                    return AccountContent(
                                      usernameController: TextEditingController(
                                        text: 'Gagal Memuat Nama',
                                      ),
                                      emailController: TextEditingController(
                                        text: 'Gagal Memuat Email',
                                      ),
                                      phoneController: TextEditingController(
                                        text: 'Gagal Memuat No HP',
                                      ),
                                      divisiController: TextEditingController(
                                        text: 'Gagal Memuat Divisi',
                                      ),
                                    );
                                  }
                                } else {
                                  return Shimmer.fromColors(
                                    baseColor: const Color(0xffe8e8e8),
                                    highlightColor: const Color(0xffc4c4c4),
                                    child: AccountContent(
                                      usernameController:
                                          TextEditingController(text: 'Nama'),
                                      emailController:
                                          TextEditingController(text: 'Email'),
                                      phoneController:
                                          TextEditingController(text: 'HP'),
                                      divisiController:
                                          TextEditingController(text: 'Divisi'),
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            log('ID USER TIDAK DITEMUKAN');
                            return AccountContent(
                              usernameController: TextEditingController(
                                text: 'Gagal Memuat Nama',
                              ),
                              emailController: TextEditingController(
                                text: 'Gagal Memuat Email',
                              ),
                              phoneController: TextEditingController(
                                text: 'Gagal Memuat No HP',
                              ),
                              divisiController: TextEditingController(
                                text: 'Gagal Memuat Divisi',
                              ),
                            );
                          }
                        },
                      );
                    } else if (value == 2) {
                      return ChangePassContent(hidePassCubit: obsecureText);
                    } else if (value == 3) {
                      return const InfoAccountContent();
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
