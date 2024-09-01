import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/features/presentation/bloc/post_pinjam_mobil/post_pinjam_mobil_bloc.dart';
import 'package:pinjem_in_app/features/presentation/cubit/penumpang_counter/penumpang_counter_cubit.dart';
import 'package:pinjem_in_app/features/presentation/pages/pinjam_mobil/pengajuan_mobil_confirm_screen.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/form/progress_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjem_mobil/form_section/pinjam_mobil_form_section.dart';
import 'package:pinjem_in_app/features/presentation/widget/status_nav_bar.dart';

class PengajuanMobilScreen extends StatefulWidget {
  const PengajuanMobilScreen({super.key});

  @override
  State<PengajuanMobilScreen> createState() => _PengajuanMobilScreenState();
}

class _PengajuanMobilScreenState extends State<PengajuanMobilScreen> {
  final TextEditingController tujuanController = TextEditingController();

  final TextEditingController deskripsiController = TextEditingController();

  final TextEditingController tanggalController = TextEditingController();

  final TextEditingController jamController = TextEditingController();

  final TextEditingController penumpangController =
      TextEditingController(text: '0');

  late String supir = '';

  final TextEditingController catatanController = TextEditingController();

  DateTime dateTime = DateTime.now();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final formatPickedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    final formatPickedTime = DateFormat('HH.mm').format(dateTime);

    final tanggalController = TextEditingController(
      text: formatPickedDate,
    );
    final jamController = TextEditingController(
      text: formatPickedTime,
    );

    final penumpangCOunterCubit = PenumpangCounterCubit();
    final postPinjamMobil = PostPinjamMobilBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => penumpangCOunterCubit),
        BlocProvider(create: (context) => postPinjamMobil),
      ],
      child: BlocListener<PostPinjamMobilBloc, PostPinjamMobilState>(
        bloc: postPinjamMobil,
        listener: (context, state) {
          if (state is PostPinjamMobilSuccess) {
            Navigator.of(context).popAndPushNamed('/formSuccess');
          } else if (state is PostPinjamMobilFailed) {
            Get.snackbar('Gagal', 'Gagal Melakukan Peminjaman Mobil');
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                StatusNavBar(
                  title1: 'Pengajuan',
                  title2: '',
                  onTap: () {},
                ),
                const ProgressBar(
                  fullColor: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                PinjamMobilFormSection(
                  dateTime: dateTime,
                  pickedDate: (DateTime newTime) {
                    setState(() => dateTime = newTime);
                    Intl.defaultLocale = 'id_ID';
                  },
                  pickedTime: (DateTime newTime) {
                    setState(() => dateTime = newTime);
                  },
                  tujuanController: tujuanController,
                  deskripsiController: deskripsiController,
                  tanggalController: tanggalController,
                  jamController: jamController,
                  penumpangController: penumpangController,
                  penumpangCounterCubit: penumpangCOunterCubit,
                  onChanged: (value) {
                    supir = value!;
                    if (supir == 'Ya') {
                      supir = '1';
                    } else if (supir == '2 Supir') {
                      supir = '2';
                    } else if (supir == 'Tidak') {
                      supir = '0';
                    }

                    log(supir); // Menggunakan print() daripada log()
                  },
                  catatanController: catatanController,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute<dynamic>(
                          builder: (context) => DetailPengajuanMobil(
                            tujuan: tujuanController.text,
                            deskripsi: deskripsiController.text,
                            tanggal: tanggalController.text,
                            jam: jamController.text,
                            penumpang: penumpangController.text,
                            sopir: supir,
                            catatan: catatanController.text,
                            postPinjamMobilBloc: postPinjamMobil,
                          ),
                        ),
                      );
                    }
                  },
                  formKey: formKey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
