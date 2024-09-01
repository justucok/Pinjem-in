import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class ResetTextFormField extends StatelessWidget {
  ResetTextFormField({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reset Password',
          style: textTextStyle.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Masukan emailmu untuk bantu reset',
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
      ],
    );
  }
}
