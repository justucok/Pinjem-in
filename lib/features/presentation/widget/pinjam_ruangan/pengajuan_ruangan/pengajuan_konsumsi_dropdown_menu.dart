import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class KonsumsiDropdown extends StatelessWidget {
  const KonsumsiDropdown({
    required this.konsumsiValue,
    required this.pesertaController,
    super.key,
  });

  final TextEditingController pesertaController;
  final void Function(String?) konsumsiValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Peserta',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              width: 100,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: pesertaController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.people_outline_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: '0',
                  hintStyle: hintTextStyle.copyWith(fontSize: 14),
                ),
                validator: (pesertaValue) {
                  if (pesertaValue!.isEmpty) {
                    return 'Peserta tidak boleh kosong!';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Konsumsi',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              width: 221,
              child: DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                ),
                items: const [
                  'Ya',
                  'Tidak',
                ],
                onChanged: konsumsiValue,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textTextStyle.copyWith(fontSize: 14),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: 'menggunakan konsumsi?',
                    hintStyle: hintTextStyle.copyWith(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                validator: (konsumsiValue) {
                  if (konsumsiValue == null) {
                    return 'Konsumsi tidak boleh kosong';
                  } else {
                    log(konsumsiValue);
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
