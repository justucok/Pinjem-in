import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class RuanganDropdown extends StatelessWidget {
  const RuanganDropdown({
    required this.ruanganValue,
    super.key,
  });

  final void Function(String?) ruanganValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ruangan',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: double.infinity,
          child: DropdownSearch<String>(
            popupProps: const PopupProps.menu(
              showSelectedItems: true,
              fit: FlexFit.loose,
            ),
            items: const [
              'Bumble Bee',
              'Optimus',
              'Hound',
              'Kuala Cafe',
            ],
            onChanged: ruanganValue,
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: textTextStyle.copyWith(fontSize: 14),
              dropdownSearchDecoration: InputDecoration(
                hintText: 'Bumble Bee',
                hintStyle: hintTextStyle.copyWith(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            validator: (ruanganValue) {
              if (ruanganValue == null) {
                return 'Ruangan tidak boleh kosong';
              } else {
                log(ruanganValue);
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
