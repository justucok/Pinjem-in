import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/bloc/pinjam_mobil/pinjam_mobil_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/pinjam_ruangan/pinjam_ruangan_bloc.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_section/home_pinjam_carousel.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_section/home_pinjam_loading.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePinjamSection extends StatelessWidget {
  const HomePinjamSection({
    required this.pinjamRuanganBloc,
    required this.pinjamMobilBloc,
    required this.mobilCurrentIndex,
    required this.ruanganCurrentIndex,
    super.key,
  });

  final PinjamRuanganBloc pinjamRuanganBloc;
  final PinjamMobilBloc pinjamMobilBloc;
  final ValueNotifier<int> mobilCurrentIndex;
  final ValueNotifier<int> ruanganCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobil',
          style: homePinjamTitleStyle.copyWith(fontSize: 18),
        ),
        BlocBuilder<PinjamMobilBloc, PinjamMobilState>(
          bloc: pinjamMobilBloc,
          builder: (context, state) {
            if (state is PinjamMobilSuccess) {
              final data = state.pinjamMobilData;
              final filterByStatus = data!.where((element) {
                final filterRes = element.status == 'Diterima';
                return filterRes;
              }).toList();
              final filterStatusCount = filterByStatus.length;
              if (filterStatusCount != 0) {
                return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 240,
                        viewportFraction: 1.05,
                        onPageChanged: (index, reason) {
                          mobilCurrentIndex.value = index;
                        },
                      ),
                      items: filterByStatus
                          .map(
                            (e) => HomePinjamCarousel(
                              tujuan: e.destination,
                              date: DateFormat('dd-MM-yyyy').format(
                                DateTime.parse(e.date),
                              ),
                              time: DateFormat('hh:mm').format(
                                DateTime.parse(e.date),
                              ),
                              statusDesc: 'Pinjaman diterima, ayo ambil mobil',
                              status: e.status,
                              notYet: false,
                              onPressed: () async {},
                            ),
                          )
                          .toList(),
                    ),
                    ValueListenableBuilder(
                      valueListenable: mobilCurrentIndex,
                      builder: (context, value, child) {
                        return AnimatedSmoothIndicator(
                          activeIndex: value,
                          count: filterStatusCount,
                          effect: const SwapEffect(
                            dotColor: Color(0xffC1E9FF),
                            activeDotColor: Color(0xff003754),
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 240,
                        viewportFraction: 1.05,
                        onPageChanged: (index, reason) {
                          mobilCurrentIndex.value = index;
                        },
                      ),
                      items: ['Anda Belum Melakukan Peminjaman']
                          .map(
                            (e) => HomePinjamCarousel(
                              tujuan: e,
                              date: 'dd-MM-yyyy',
                              time: 'hh:mm',
                              statusDesc: 'Belum Ada Peminjaman',
                              status: '-',
                              notYet: true,
                              onPressed: () {},
                            ),
                          )
                          .toList(),
                    ),
                    ValueListenableBuilder(
                      valueListenable: mobilCurrentIndex,
                      builder: (context, value, child) {
                        return AnimatedSmoothIndicator(
                          activeIndex: value,
                          count:
                              filterByStatus.isNotEmpty ? filterStatusCount : 0,
                          effect: const SlideEffect(
                            dotColor: Color(0xffC1E9FF),
                            activeDotColor: Color(0xff003754),
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            } else if (state is PinjamMobilLoading) {
              return Shimmer.fromColors(
                baseColor: const Color(0xffe8e8e8),
                highlightColor: const Color(0xffc4c4c4),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 240,
                    viewportFraction: 1.05,
                    onPageChanged: (index, reason) {
                      ruanganCurrentIndex.value = index;
                    },
                  ),
                  items:
                      ['null'].map((e) => const HomePinjamLoading()).toList(),
                ),
              );
            } else {
              return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 240,
                      viewportFraction: 1.05,
                      onPageChanged: (index, reason) {
                        mobilCurrentIndex.value = index;
                      },
                    ),
                    items: ['Gagal Memuat Pinjaman']
                        .map(
                          (e) => HomePinjamCarousel(
                            tujuan: e,
                            date: '-',
                            time: '-',
                            statusDesc: 'Gagal Memuat Pinjaman',
                            status: '-',
                            notYet: false,
                            loadAgain: true,
                            onPressed: () {
                              pinjamMobilBloc.add(LoadPinjamMobilData());
                            },
                          ),
                        )
                        .toList(),
                  ),
                  ValueListenableBuilder(
                    valueListenable: mobilCurrentIndex,
                    builder: (context, value, child) {
                      return AnimatedSmoothIndicator(
                        activeIndex: value,
                        count: 0,
                        effect: const SlideEffect(
                          dotColor: Color(0xffC1E9FF),
                          activeDotColor: Color(0xff003754),
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Ruangan',
          style: homePinjamTitleStyle.copyWith(fontSize: 18),
        ),
        BlocBuilder<PinjamRuanganBloc, PinjamRuanganState>(
          bloc: pinjamRuanganBloc,
          builder: (context, state) {
            if (state is PinjamRuanganSuccess) {
              final data = state.pinjamRuanganData;
              final spesific = data!.where((element) {
                final res = element.status == 'Diterima';
                return res;
              }).toList();
              final spesificCount = spesific.length;
              if (spesificCount != 0) {
                return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 240,
                        viewportFraction: 1.05,
                        onPageChanged: (index, reason) {
                          ruanganCurrentIndex.value = index;
                        },
                      ),
                      items: spesific
                          .map(
                            (e) => HomePinjamCarousel(
                              tujuan: e.roomName,
                              date: DateFormat('dd-MM-yyyy')
                                  .format(DateTime.parse(e.date)),
                              time: DateFormat('hh:mm').format(
                                DateFormat('hh:mm').parse(e.timeStart),
                              ),
                              statusDesc: 'Pinjaman diterima, ayo digunakan',
                              status: e.status,
                              notYet: false,
                              onPressed: () {},
                            ),
                          )
                          .toList(),
                    ),
                    ValueListenableBuilder(
                      valueListenable: ruanganCurrentIndex,
                      builder: (context, value, child) {
                        return AnimatedSmoothIndicator(
                          activeIndex: value,
                          count: spesificCount,
                          effect: const SlideEffect(
                            dotColor: Color(0xffC1E9FF),
                            activeDotColor: Color(0xff003754),
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 240,
                        viewportFraction: 1.05,
                        onPageChanged: (index, reason) {
                          ruanganCurrentIndex.value = index;
                        },
                      ),
                      items: ['Anda Belum Melakukan Peminjaman']
                          .map(
                            (e) => HomePinjamCarousel(
                              tujuan: e,
                              date: 'YYYY-MM-DD',
                              time: 'hh:mm a',
                              statusDesc: 'Belum Ada Peminjaman',
                              status: '-',
                              notYet: true,
                              onPressed: () {},
                            ),
                          )
                          .toList(),
                    ),
                    ValueListenableBuilder(
                      valueListenable: ruanganCurrentIndex,
                      builder: (context, value, child) {
                        return AnimatedSmoothIndicator(
                          activeIndex: value,
                          count: spesific.isNotEmpty ? spesificCount : 0,
                          effect: const SlideEffect(
                            dotColor: Color(0xffC1E9FF),
                            activeDotColor: Color(0xff003754),
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            } else if (state is PinjamRuanganLoading) {
              return Shimmer.fromColors(
                baseColor: const Color(0xffe8e8e8),
                highlightColor: const Color(0xffc4c4c4),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 240,
                    viewportFraction: 1.05,
                    onPageChanged: (index, reason) {
                      ruanganCurrentIndex.value = index;
                    },
                  ),
                  items:
                      ['null'].map((e) => const HomePinjamLoading()).toList(),
                ),
              );
            } else {
              return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 240,
                      viewportFraction: 1.05,
                      onPageChanged: (index, reason) {
                        mobilCurrentIndex.value = index;
                      },
                    ),
                    items: ['Gagal Memuat Pinjaman']
                        .map(
                          (e) => HomePinjamCarousel(
                            tujuan: e,
                            date: '-',
                            time: '-',
                            statusDesc: 'Gagal Memuat Pinjaman',
                            status: '-',
                            notYet: false,
                            loadAgain: true,
                            onPressed: () {
                              pinjamMobilBloc.add(LoadPinjamMobilData());
                            },
                          ),
                        )
                        .toList(),
                  ),
                  ValueListenableBuilder(
                    valueListenable: mobilCurrentIndex,
                    builder: (context, value, child) {
                      return AnimatedSmoothIndicator(
                        activeIndex: value,
                        count: 0,
                        effect: const SlideEffect(
                          dotColor: Color(0xffC1E9FF),
                          activeDotColor: Color(0xff003754),
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
