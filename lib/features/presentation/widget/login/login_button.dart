// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/bloc/login/login_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.onPressed,
    this.loginBloc,
    super.key,
  });

  final dynamic Function() onPressed;
  final LoginBloc? loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            maximumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: primaryButtonColor,
          ),
          onPressed: onPressed,
          child: state is LoginLoading
              ? const SizedBox(
                  height: 35,
                  width: 35,
                  child: CircularProgressIndicator(
                    color: Color(0xffffffff),
                  ),
                )
              : Text(
                  'Masuk',
                  style: buttonTextStyle.copyWith(fontSize: 16),
                ),
        );
      },
    );
  }
}
