import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class AccountContent extends StatelessWidget {
  const AccountContent({
    required this.usernameController,
    required this.emailController,
    required this.phoneController,
    required this.divisiController,
    super.key,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController divisiController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: hintTextColor),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akun',
            style: alternativeTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: Image.asset(
              'lib/app/assets/profile-big.png',
              height: 100,
              width: 100,
            ),
          ),
          Text(
            'Nama',
            style: titleTextStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: hintTextColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(usernameController.text),
          ),
          Text(
            'Email',
            style: titleTextStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: hintTextColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(emailController.text),
          ),
          Text(
            'Nomor',
            style: titleTextStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: hintTextColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(phoneController.text),
          ),
          Text(
            'Divisi',
            style: titleTextStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: hintTextColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(divisiController.text),
          ),
        ],
      ),
    );
  }
}
