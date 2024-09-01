import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/bloc/register/register_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    required this.onPressed,
    super.key,
  });

  final dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        maximumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: primaryButtonColor,
      ),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterLoading) {
            return const SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(
                color: Color(0xffffffff),
              ),
            );
          } else {
            return Text(
              'Daftar',
              style: buttonTextStyle.copyWith(fontSize: 16),
            );
          }
        },
      ),
    );
  }
}
