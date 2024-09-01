import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pinjem_in_app/features/auth/data/body/register_body.dart';
import 'package:pinjem_in_app/features/presentation/bloc/register/register_bloc.dart';
import 'package:pinjem_in_app/features/presentation/cubit/hide_pass/hide_pass_cubit.dart';
import 'package:pinjem_in_app/features/presentation/widget/auth_header.dart';
import 'package:pinjem_in_app/features/presentation/widget/register/login_text_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/register/register_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/register/register_textformfields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> regKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  late String divisi;

  @override
  Widget build(BuildContext context) {
    final obscureCubit = HidePassCubit();
    final registerBloc = RegisterBloc();
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => obscureCubit,
          ),
          BlocProvider(
            create: (context) => registerBloc,
          ),
        ],
        child: BlocListener<RegisterBloc, RegisterState>(
          bloc: registerBloc,
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Get.snackbar('Register Berhasil', state.message);
              nameController.clear();
              emailController.clear();
              passController.clear();
              phoneController.clear();
              divisi = '';
            } else if (state is RegisterFailed) {
              Get.snackbar('Register Gagal', state.mesage);
            }
          },
          child: Scaffold(
            body: Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: regKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const AuthHeader(),
                    RegisterTextFormField(
                      hidePassCubit: obscureCubit,
                      nameController: nameController,
                      emailController: emailController,
                      passController: passController,
                      phoneController: phoneController,
                      divisi: (value) {
                        divisi = value!;
                        log(divisi);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RegisterButton(
                      onPressed: () {
                        if (regKey.currentState!.validate()) {
                          registerBloc.add(
                            PostRegister(
                              body: RegisterBody(
                                name: nameController.text,
                                email: emailController.text,
                                nomor: int.tryParse(phoneController.text)!,
                                divisi: divisi,
                                password: passController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    LoginTextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
