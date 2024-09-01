import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/features/presentation/cubit/hide_pass/hide_pass_cubit.dart';
import 'package:pinjem_in_app/features/presentation/widget/auth_header.dart';
import 'package:pinjem_in_app/features/presentation/widget/reset_pass/create_new_password_formfields.dart';
import 'package:pinjem_in_app/features/presentation/widget/reset_pass/send_button.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});
  final GlobalKey<FormState> newPassKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final obscureCubit = HidePassCubit();
    return SafeArea(
      child: BlocProvider(
        create: (context) => obscureCubit,
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: newPassKey,
              child: ListView(
                children: [
                  const AuthHeader(),
                  CreateNewPasswordTextFormFields(
                    hidePassCubit: obscureCubit,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SendButton(
                    onPressed: () {
                      if (newPassKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed('/newPassSucc');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
