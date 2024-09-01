import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/features/presentation/bloc/pinjam_mobil/pinjam_mobil_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/pinjam_ruangan/pinjam_ruangan_bloc.dart';
import 'package:pinjem_in_app/features/presentation/widget/recap_section/home_recap_count.dart';
import 'package:pinjem_in_app/features/presentation/widget/recap_section/home_recap_date.dart';
import 'package:pinjem_in_app/features/presentation/widget/recap_section/home_recap_pick_date.dart';
import 'package:shimmer/shimmer.dart';

class HomeRecapSection extends StatelessWidget {
  HomeRecapSection({
    required this.pinjamRuanganBloc,
    required this.pinjamMobilBloc,
    super.key,
  });

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  final dateNow = DateTime.now();
  final PinjamRuanganBloc pinjamRuanganBloc;
  final PinjamMobilBloc pinjamMobilBloc;

  @override
  Widget build(BuildContext context) {
    //Date Now
    final dateNowFormated = DateFormat('dd MMMM yyyy').format(dateNow);
    //Daily
    final daily = DateTime(dateNow.year, dateNow.month, dateNow.day);
    final dailyFormated = DateFormat('dd MMMM yyyy').format(daily);
    //Weekly
    //FDOTW
    final fdotw = dateNow.subtract(Duration(days: dateNow.weekday - 1));
    final fdotwDateOnly = DateTime(fdotw.year, fdotw.month, fdotw.day);
    final fdotwFormated = DateFormat('dd MMMM yyyy').format(fdotwDateOnly);
    //LDORW
    final ldotw =
        dateNow.add(Duration(days: DateTime.daysPerWeek - dateNow.weekday));
    final ldotwDateOnly = DateTime(ldotw.year, ldotw.month, ldotw.day);

    final ldotwFormated = DateFormat('dd MMMM yyyy').format(ldotwDateOnly);
    //Monthly
    final fdotm = DateTime(dateNow.year, dateNow.month);
    final ldotm = DateTime(dateNow.year, dateNow.month + 1, 0);
    final fdotmFormated = DateFormat('dd MMMM yyyy').format(fdotm);
    final ldotmFormated = DateFormat('dd MMMM yyyy').format(ldotm);

    return Container(
      width: 335,
      height: 475,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: Constants.items.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _currentIndex.value = index;
                    },
                    child: ValueListenableBuilder(
                      valueListenable: _currentIndex,
                      builder: (context, value, child) {
                        return HomeRecapPickDate(
                          value: value,
                          index: index,
                          items: Constants.items,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, value, child) {
                if (value == 0) {
                  return HomeRecapDate(
                    dateStart: dailyFormated,
                    dateEnd: dateNowFormated,
                  );
                } else if (value == 1) {
                  return HomeRecapDate(
                    dateStart: fdotwFormated,
                    dateEnd: ldotwFormated,
                  );
                } else if (value == 2) {
                  return HomeRecapDate(
                    dateStart: fdotmFormated,
                    dateEnd: ldotmFormated,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<PinjamMobilBloc, PinjamMobilState>(
              bloc: pinjamMobilBloc,
              builder: (context, state) {
                if (state is PinjamMobilSuccess) {
                  final data = state.pinjamMobilData;
                  return ValueListenableBuilder(
                    valueListenable: _currentIndex,
                    builder: (context, value, child) {
                      final borrow = data!.where(
                        (element) {
                          final date = DateTime.parse(element.date);
                          final borrowDateFormat =
                              DateFormat('yyyy-MM-dd').format(date);
                          final borrowDateParsed =
                              DateTime.parse(borrowDateFormat);
                          if (value == 0) {
                            return daily.isAtSameMomentAs(borrowDateParsed);
                          } else if (value == 1) {
                            return fdotwDateOnly.isBefore(date) &&
                                ldotw.isAfter(date);
                          } else {
                            return fdotm.isBefore(date) && ldotm.isAfter(date);
                          }
                        },
                      );
                      final acceptedCar = data.where((element) {
                        final status = element.status;
                        final accDate = DateTime.parse(element.date);
                        final accDateFormat =
                            DateFormat('yyyy-MM-dd').format(accDate);
                        final accDateParsed = DateTime.parse(accDateFormat);
                        if (value == 0) {
                          if (daily.isAtSameMomentAs(accDateParsed)) {
                            return status == 'Diterima';
                          } else {
                            return false;
                          }
                        } else if (value == 1) {
                          if (fdotwDateOnly.isBefore(accDate) &&
                              ldotw.isAfter(accDate)) {
                            return status == 'Diterima';
                          } else {
                            return false;
                          }
                        } else {
                          if (fdotm.isBefore(accDate) &&
                              ldotm.isAfter(accDate)) {
                            return status == 'Diterima';
                          } else {
                            return false;
                          }
                        }
                      });

                      final rejectedCar = data.where((element) {
                        final status = element.status;
                        final rejDate = DateTime.parse(element.date);
                        final rejDateFormat =
                            DateFormat('yyyy-MM-dd').format(rejDate);
                        final rejDateParsed = DateTime.parse(rejDateFormat);
                        if (value == 0) {
                          if (daily.isAtSameMomentAs(rejDateParsed)) {
                            return status == 'Ditolak';
                          } else {
                            return false;
                          }
                        } else if (value == 1) {
                          if (fdotwDateOnly.isBefore(rejDate) &&
                              ldotw.isAfter(rejDate)) {
                            return status == 'Ditolak';
                          } else {
                            return false;
                          }
                        } else if (value == 2) {
                          if (fdotm.isBefore(rejDate) &&
                              ldotm.isAfter(rejDate)) {
                            return status == 'Ditolak';
                          } else {
                            return false;
                          }
                        } else {
                          return false;
                        }
                      });

                      final acceptedCarCount = acceptedCar.length;
                      final rejectedCarCount = rejectedCar.length;
                      final borrowCount = borrow.length;

                      return HomeRecapCount(
                        backgroundColor: const Color(0xffC1E9FF),
                        shimmer: false,
                        countTitle: 'Mobil',
                        pinjamCount: '$borrowCount',
                        diterimaCount: '$acceptedCarCount',
                        ditolakCount: '$rejectedCarCount',
                      );
                    },
                  );
                } else if (state is PinjamMobilLoading) {
                  return Shimmer.fromColors(
                    baseColor: const Color(0xffe8e8e8),
                    highlightColor: const Color(0xffc4c4c4),
                    child: const HomeRecapCount(
                      shimmer: true,
                      countTitle: 'Mobil',
                      pinjamCount: '',
                      diterimaCount: '',
                      ditolakCount: '',
                    ),
                  );
                } else {
                  return const HomeRecapCount(
                    backgroundColor: Color(0xffC1E9FF),
                    shimmer: false,
                    countTitle: 'Gagal Memuat Data',
                    pinjamCount: '-',
                    diterimaCount: '-',
                    ditolakCount: '-',
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<PinjamRuanganBloc, PinjamRuanganState>(
              bloc: pinjamRuanganBloc,
              builder: (context, state) {
                if (state is PinjamRuanganSuccess) {
                  final data = state.pinjamRuanganData;
                  return ValueListenableBuilder(
                    valueListenable: _currentIndex,
                    builder: (context, value, child) {
                      final dateRange = data!.where(
                        (element) {
                          final date = DateTime.parse(element.date);
                          if (value == 0) {
                            return daily.isAtSameMomentAs(date);
                          } else if (value == 1) {
                            return fdotwDateOnly.isBefore(date) ||
                                fdotwDateOnly.isAtSameMomentAs(date) &&
                                    ldotw.isAfter(date);
                          } else {
                            return fdotm.isBefore(date) && ldotm.isAfter(date);
                          }
                        },
                      );
                      final acceptedRoom = data.where((element) {
                        final status = element.status;
                        final accDate = DateTime.parse(element.date);
                        if (value == 0) {
                          if (daily.isAtSameMomentAs(accDate)) {
                            return status == 'Diterima';
                          } else {
                            return false;
                          }
                        } else if (value == 1) {
                          if (fdotwDateOnly.isBefore(accDate) ||
                              fdotwDateOnly.isAtSameMomentAs(accDate) &&
                                  ldotw.isAfter(accDate)) {
                            return status == 'Diterima';
                          } else {
                            return false;
                          }
                        } else {
                          if (fdotm.isBefore(accDate) &&
                              ldotm.isAfter(accDate)) {
                            return status == 'Diterima';
                          } else {
                            return false;
                          }
                        }
                      });

                      final rejectedRoom = data.where((element) {
                        final status = element.status;
                        final rejDate = DateTime.parse(element.date);
                        if (value == 0) {
                          if (daily.isAtSameMomentAs(rejDate)) {
                            return status == 'Ditolak';
                          } else {
                            return false;
                          }
                        } else if (value == 1) {
                          if (fdotwDateOnly.isBefore(rejDate) ||
                              fdotwDateOnly.isAtSameMomentAs(rejDate) &&
                                  ldotw.isAfter(rejDate)) {
                            return status == 'Ditolak';
                          } else {
                            return false;
                          }
                        } else if (value == 2) {
                          if (fdotm.isBefore(rejDate) &&
                              ldotm.isAfter(rejDate)) {
                            return status == 'Ditolak';
                          } else {
                            return false;
                          }
                        } else {
                          return false;
                        }
                      });

                      final acceptedRoomCount = acceptedRoom.length;
                      final rejectedRoomCount = rejectedRoom.length;
                      final dateRangeCount = dateRange.length;
                      return HomeRecapCount(
                        backgroundColor: const Color(0xffFDEDCA),
                        shimmer: false,
                        countTitle: 'Ruangan',
                        pinjamCount: '$dateRangeCount',
                        diterimaCount: '$acceptedRoomCount',
                        ditolakCount: '$rejectedRoomCount',
                      );
                    },
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: const Color(0xffe8e8e8),
                    highlightColor: const Color(0xffc4c4c4),
                    child: const HomeRecapCount(
                      shimmer: true,
                      countTitle: 'Ruangan',
                      pinjamCount: '',
                      diterimaCount: '',
                      ditolakCount: '',
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
