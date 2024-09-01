import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/features/home/data/response/pinjam_ruangan_response.dart';
import 'package:pinjem_in_app/features/presentation/bloc/pinjam_ruangan/pinjam_ruangan_bloc.dart';
import 'package:pinjem_in_app/features/presentation/pages/riwayat_pinjam_ruangan/detail_riwayat_pinjam_ruangan_screen.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/riwayat_pinjam_ruangan/riwayat_pinjam_ruangan_breadcrumbs.dart';
import 'package:pinjem_in_app/features/presentation/widget/riwayat_pinjam_ruangan/riwayat_pinjam_ruangan_loading.dart';
import 'package:pinjem_in_app/features/presentation/widget/riwayat_pinjam_ruangan/riwayat_pinjam_ruangan_section.dart';
import 'package:shimmer/shimmer.dart';

class RiwayatPinjamRuanganScreen extends StatefulWidget {
  const RiwayatPinjamRuanganScreen({super.key});

  @override
  State<RiwayatPinjamRuanganScreen> createState() =>
      _RiwayatPinjamRuanganScreenState();
}

class _RiwayatPinjamRuanganScreenState
    extends State<RiwayatPinjamRuanganScreen> {
  final ValueNotifier<int> filterData1 = ValueNotifier(0);

  final ValueNotifier<int> filterDat2 = ValueNotifier(0);

  late List<PinjamRuanganData> list = lists;
  late List<PinjamRuanganData> statusBarFilter;
  late List<PinjamRuanganData> lists;

  @override
  Widget build(BuildContext context) {
    final pinjamRuanganBloc = PinjamRuanganBloc()..add(LoadPinjamRuangan());

    return BlocProvider(
      create: (context) => pinjamRuanganBloc,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const RiwayatPinjamRuanganBreadcrumbs(
                      riwayatDetail: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          list = statusBarFilter.where((element) {
                            final searchBar =
                                element.roomName.toLowerCase().contains(value);
                            return searchBar;
                          }).toList();
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xffB2B2B2),
                        ),
                        hintText: 'Cari Pinjaman',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xffB2B2B2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xffB2B2B2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xffB2B2B2),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Constants.filterPinjaman.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        final data = Constants.filterPinjaman;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                filterData1.value = index;

                                setState(() {
                                  if (data[index] == 'Semua') {
                                    list = lists;
                                    statusBarFilter = list;
                                  } else {
                                    list = lists.where((element) {
                                      final statusBar =
                                          element.status == data[index];

                                      return statusBar;
                                    }).toList();
                                    statusBarFilter = list;
                                  }
                                });
                              },
                              child: ValueListenableBuilder(
                                valueListenable: filterData1,
                                builder: (context, value, child) {
                                  return Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: value == index
                                          ? const Color(0xff2B9FDC)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child: Text(
                                        data[index],
                                        style: TextStyle(
                                          color: value == index
                                              ? Colors.white
                                              : Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<PinjamRuanganBloc, PinjamRuanganState>(
                bloc: pinjamRuanganBloc,
                builder: (context, state) {
                  if (state is PinjamRuanganSuccess) {
                    lists = state.pinjamRuanganData!;
                    if (list.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: list.length,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<dynamic>(
                                        builder: (context) =>
                                            DetailRiwayatPinjamRuanganScreen(
                                          transactionId: '${list[index].id}',
                                        ),
                                      ),
                                    );
                                  },
                                  child: RiwayatPinjamRuanganSection(
                                    ruangan: list[index].roomName,
                                    tanggal: list[index].date,
                                    status: list[index].status,
                                    jam: DateFormat('HH:mm').format(
                                      DateFormat('HH:mm')
                                          .parse(list[index].timeStart),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return const Text(
                        'Data Pinjaman Tidak Ditemukan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: const Color(0xffe8e8e8),
                            highlightColor: const Color(0xffc4c4c4),
                            child: const Column(
                              children: [
                                RiwayatPinjamRuanganLoading(
                                  ruangan: 'Ruangan',
                                  tanggal: 'Tanggal',
                                  status: 'Status',
                                  jam: 'Jam',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
