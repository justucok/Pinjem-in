import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/cubit/hide_pass/hide_pass_cubit.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    required this.hidePassCubit,
    required this.emailController,
    required this.passController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passController;
  final HidePassCubit hidePassCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Masuk',
          style: textTextStyle.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Email',
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 2,
        ),
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'masukan email anda',
            hintStyle: hintTextStyle.copyWith(fontSize: 14),
          ),
          validator: (emailValue) {
            if (emailValue!.isEmpty) {
              return 'Email tidak boleh kosong!';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Password',
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 2,
        ),
        BlocBuilder<HidePassCubit, HidePassState>(
          builder: (context, state) {
            return TextFormField(
              controller: passController,
              obscureText: state is HidePassOn,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'masukan password anda',
                hintStyle: hintTextStyle.copyWith(fontSize: 14),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (state is HidePassOff) {
                      hidePassCubit.hidePass();
                    } else if (state is HidePassOn) {
                      hidePassCubit.showPass();
                    }
                  },
                  icon: Icon(
                    state is HidePassOff
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              validator: (passValue) {
                if (passValue!.isEmpty) {
                  return 'Password tidak boleh kosong!';
                } else {
                  return null;
                }
              },
            );
          },
        ),
      ],
    );
  }
}
