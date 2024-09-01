import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/home_service.dart';
import 'package:pinjem_in_app/features/home/data/response/pinjam_ruangan_response.dart';

part 'pinjam_ruangan_event.dart';
part 'pinjam_ruangan_state.dart';

class PinjamRuanganBloc extends Bloc<PinjamRuanganEvent, PinjamRuanganState> {
  PinjamRuanganBloc() : super(PinjamRuanganInitial()) {
    on<LoadPinjamRuangan>((event, emit) async {
      emit(PinjamRuanganLoading());

      try {
        final result = await PinjamRuanganService.getPinjamRuanganData();

        if (result.status == 200) {
          emit(PinjamRuanganSuccess(pinjamRuanganData: result.data));
        } else {
          log('Failed');
          emit(PinjamRuanganFailed());
        }
      } catch (e) {
        log('Pinjam Ruangan Catch: $e');
      }
    });
  }
}
