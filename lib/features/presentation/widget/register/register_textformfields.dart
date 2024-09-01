// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/cubit/hide_pass/hide_pass_cubit.dart';

class RegisterTextFormField extends StatelessWidget {
  RegisterTextFormField({
    required this.hidePassCubit,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passController,
    required this.divisi,
    super.key,
  });

  final HidePassCubit hidePassCubit;

  final TextEditingController nameController;
  final TextEditingController emailController;

  final TextEditingController phoneController;

  final TextEditingController passController;

  final void Function(String?)? divisi;

  final RegExp phoneNumberRegEx = RegExp(r'^[0-9 +]+$');

  final RegExp mailRegEx = RegExp('@');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daftar',
          style: textTextStyle.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Name',
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'masukan nama anda',
            hintStyle: hintTextStyle.copyWith(fontSize: 14),
          ),
          validator: (nameValue) {
            if (nameValue!.isEmpty) {
              return 'Nama tidak boleh kosong!';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Email',
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
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
          height: 20,
        ),
        Text(
          'Nomor',
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'masukan nomor anda',
            hintStyle: hintTextStyle.copyWith(fontSize: 14),
          ),
          validator: (phoneNumberValue) {
            if (phoneNumberValue!.isEmpty) {
              return 'Nomor telepon tidak boleh kosong!';
            } else if (phoneNumberValue.length < 10 ||
                phoneNumberValue.length > 15) {
              return 'Nomor telepon tidak valid';
            } else if (!phoneNumberRegEx.hasMatch(phoneNumberValue)) {
              return 'Nomor telepon hanya memuat angka 0-9';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Divisi',
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            showSelectedItems: true,
            fit: FlexFit.loose,
          ),
          items: const ['VARX', 'Customer Service', 'Marketing'],
          onChanged: divisi,
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: textTextStyle.copyWith(fontSize: 16),
            dropdownSearchDecoration: InputDecoration(
              hintText: 'Pilih Divisi',
              hintStyle: hintTextStyle.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          validator: (divisiValue) {
            if (divisiValue == null) {
              return 'Divisi tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Password',
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
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
