import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/cubit/penumpang_counter/penumpang_counter_cubit.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_datepicker.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_heading.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_title.dart';

class PinjamMobilFormSection extends StatelessWidget {
  const PinjamMobilFormSection({
    required this.tujuanController,
    required this.deskripsiController,
    required this.jamController,
    required this.tanggalController,
    required this.penumpangController,
    required this.penumpangCounterCubit,
    required this.onChanged,
    required this.catatanController,
    required this.onPressed,
    required this.formKey,
    required this.pickedDate,
    required this.pickedTime,
    required this.dateTime,
    super.key,
  });

  final TextEditingController tujuanController;
  final TextEditingController deskripsiController;
  final TextEditingController tanggalController;
  final TextEditingController jamController;
  final TextEditingController penumpangController;
  final PenumpangCounterCubit penumpangCounterCubit;
  final void Function(String?)? onChanged;
  final TextEditingController catatanController;
  final void Function() onPressed;
  final GlobalKey<FormState> formKey;
  final void Function(DateTime) pickedDate;
  final void Function(DateTime) pickedTime;
  final DateTime dateTime;

  // DateTime startTime = DateTime()

  @override
  Widget build(BuildContext context) {
    log('out ${tanggalController.text}');
    log('out ${tanggalController.text}');

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PinjamMobilFormHeading(
              heading: 'Pinjaman',
            ),
            const SizedBox(
              height: 10,
            ),
            const PinjamMobilFormTitle(title: 'Tujuan'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: tujuanController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'Masukkan tujuan anda',
                hintStyle: hintTextStyle.copyWith(fontSize: 14),
              ),
              validator: (tujuanValue) {
                if (tujuanValue!.isEmpty) {
                  return 'Tujuan tidak boleh kosong!';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const PinjamMobilFormTitle(title: 'Deskripsi'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: deskripsiController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'Deskripsikan tujuan anda',
                hintStyle: hintTextStyle.copyWith(fontSize: 14),
              ),
              validator: (deskripsiValue) {
                if (deskripsiValue!.isEmpty) {
                  return 'Deskripsi tidak boleh kosong!';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            PinjamMobilFormDatePicker(
              tanggalController: tanggalController,
              jamController: jamController,
              pickedDate: pickedDate,
              pickedTime: pickedTime,
              dateTime: dateTime,
            ),
            const SizedBox(
              height: 20,
            ),
            const PinjamMobilFormHeading(heading: 'Penumpang & Sopir'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PinjamMobilFormTitle(
                      title: 'Penumpang',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    BlocBuilder<PenumpangCounterCubit, PenumpangCounterState>(
                      bloc: penumpangCounterCubit,
                      builder: (context, state) {
                        return SizedBox(
                          width: 100,
                          child: TextFormField(
                            controller: penumpangController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintText: '0',
                              contentPadding: const EdgeInsets.only(left: 30),
                              hintStyle: hintTextStyle.copyWith(fontSize: 14),
                              suffixIcon: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      penumpangCounterCubit.increment();
                                      penumpangController.text =
                                          penumpangCounterCubit.state.countValue
                                              .toString();
                                    },
                                    child: const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Icon(Icons.keyboard_arrow_up),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (penumpangCounterCubit
                                              .state.countValue >=
                                          1) {
                                        penumpangCounterCubit.decrement();
                                        penumpangController.text =
                                            penumpangCounterCubit
                                                .state.countValue
                                                .toString();
                                      }
                                    },
                                    child: const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            validator: (penumpangValue) {
                              if (penumpangValue!.isEmpty) {
                                return 'Penumpang tidak boleh kosong!';
                              } else {
                                return null;
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PinjamMobilFormTitle(
                      title: 'Sopir',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 200,
                      child: DropdownSearch<String>(
                        popupProps: const PopupProps.menu(
                          showSelectedItems: true,
                          fit: FlexFit.loose,
                        ),
                        items: const [
                          'Ya',
                          '2 Supir',
                          'Tidak',
                        ],
                        onChanged: onChanged,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          baseStyle: textTextStyle.copyWith(fontSize: 16),
                          dropdownSearchDecoration: InputDecoration(
                            hintText: 'Menggunakan Sopir?',
                            hintStyle: hintTextStyle.copyWith(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        validator: (sopirValue) {
                          if (sopirValue == null) {
                            return 'Sopir tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const PinjamMobilFormTitle(title: 'Catatan'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: catatanController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'Masukan catatan anda terkait penumpang dan sopir',
                hintStyle: hintTextStyle.copyWith(fontSize: 14),
              ),
              validator: (catatanValue) {
                if (catatanValue!.isEmpty) {
                  return 'Catatan tidak boleh kosong!';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 10,
            ),
            PinjamMobilFormButton(
              btnText: 'Selanjutnya',
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
