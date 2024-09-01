import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pinjem_in_app/features/auth/data/body/login_body.dart';
import 'package:pinjem_in_app/features/presentation/bloc/login/login_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/login_pref/login_pref_bloc.dart';
import 'package:pinjem_in_app/features/presentation/cubit/hide_pass/hide_pass_cubit.dart';
import 'package:pinjem_in_app/features/presentation/widget/auth_header.dart';
import 'package:pinjem_in_app/features/presentation/widget/login/login_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/login/login_textformfield.dart';
import 'package:pinjem_in_app/features/presentation/widget/login/register_text_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/login/reset_text_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> logKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final obscureCubit = HidePassCubit();
  final loginBloc = LoginBloc();
  final loginPrefBloc = LoginPrefBloc()..add(LoadLoginPref());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => obscureCubit),
          BlocProvider(
            create: (context) => loginBloc,
          ),
          BlocProvider(
            create: (context) => loginPrefBloc,
          ),
        ],
        child: BlocListener<LoginBloc, LoginState>(
          bloc: loginBloc,
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushReplacementNamed('/home');
            } else if (state is LoginFailed) {
              Get.snackbar('Login Gagal', state.message);
            }
          },
          child: Scaffold(
            body: Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: logKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const AuthHeader(),
                    LoginTextFormField(
                      hidePassCubit: obscureCubit,
                      emailController: emailController,
                      passController: passController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const ResetTextButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginButton(
                      loginBloc: loginBloc,
                      onPressed: () {
                        if (logKey.currentState!.validate()) {
                          loginBloc.add(
                            UserLogin(
                              body: LoginBody(
                                email: emailController.text,
                                password: passController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RegisterTextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/reg');
                      },
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
