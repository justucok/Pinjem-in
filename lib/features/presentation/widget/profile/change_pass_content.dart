import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/cubit/hide_pass/hide_pass_cubit.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/pengajuan_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/reset_pass/create_new_password_formfields.dart';

class ChangePassContent extends StatelessWidget {
  const ChangePassContent({
    required this.hidePassCubit,
    super.key,
  });

  final HidePassCubit hidePassCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: hintTextColor),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          CreateNewPasswordTextFormFields(hidePassCubit: hidePassCubit),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          ReqButton(
            buttonPressed: () {},
          ),
        ],
      ),
    );
  }
}
