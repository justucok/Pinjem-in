import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/login_pref/login_pref_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/pinjam_mobil/pinjam_mobil_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/pinjam_ruangan/pinjam_ruangan_bloc.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/menu_section/home_menu_section.dart';
import 'package:pinjem_in_app/features/presentation/widget/pinjam_section/home_pinjam_section.dart';
import 'package:pinjem_in_app/features/presentation/widget/recap_section/home_recap_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final dummyBloc = DummyBloc()..add(LoadDummyData());
  final pinjamRuanganBloc = PinjamRuanganBloc()..add(LoadPinjamRuangan());
  final pinjamMobilBloc = PinjamMobilBloc()..add(LoadPinjamMobilData());
  final loginPrefBloc = LoginPrefBloc()..add(LoadLoginPref());
  final ValueNotifier<int> mobilCurrentIndex = ValueNotifier(0);
  final ValueNotifier<int> ruanganCurrentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (context) => dummyBloc,
          // ),
          BlocProvider(
            create: (context) => loginPrefBloc,
          ),
          BlocProvider(
            create: (context) => pinjamRuanganBloc,
          ),
          BlocProvider(
            create: (context) => pinjamMobilBloc,
          ),
        ],
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(),
          ),
          body: Column(
            children: [
              // const TopBar(),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    // dummyBloc.add(LoadDummyData());
                    pinjamRuanganBloc.add(LoadPinjamRuangan());
                    pinjamMobilBloc.add(LoadPinjamMobilData());
                    mobilCurrentIndex.value = 0;
                    ruanganCurrentIndex.value = 0;
                  },
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      HomePinjamSection(
                        pinjamRuanganBloc: pinjamRuanganBloc,
                        pinjamMobilBloc: pinjamMobilBloc,
                        mobilCurrentIndex: mobilCurrentIndex,
                        ruanganCurrentIndex: ruanganCurrentIndex,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      HomeMenuSection(
                        onTapMobil: () {
                          Navigator.of(context).pushNamed('/pinjamMobil');
                        },
                        onTapRiwayatPinjamMobil: () {
                          Navigator.of(context)
                              .pushNamed('/riwayatPinjamMobil');
                        },
                        onTapRuangan: () {
                          Navigator.of(context).pushNamed('/cekTanggal');
                        },
                        onTapRiwayatPinjamRuangan: () {
                          Navigator.of(context)
                              .pushNamed('/riwayatPinjamRuangan');
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      HomeRecapSection(
                        pinjamRuanganBloc: pinjamRuanganBloc,
                        pinjamMobilBloc: pinjamMobilBloc,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
