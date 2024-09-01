import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/home_service.dart';
import 'package:pinjem_in_app/features/home/data/response/pinjam_mobil_response.dart';

part 'pinjam_mobil_event.dart';
part 'pinjam_mobil_state.dart';

class PinjamMobilBloc extends Bloc<PinjamMobilEvent, PinjamMobilState> {
  PinjamMobilBloc() : super(PinjamMobilInitial()) {
    on<LoadPinjamMobilData>((event, emit) async {
      emit(PinjamMobilLoading());
      try {
        final response = await PinjamMobilService.getPinjamMobilData();

        if (response.data != null) {
          emit(PinjamMobilSuccess(pinjamMobilData: response.data));
        } else if (response.status == 404) {
          emit(PinjamMobilFailed());
        } else {
          emit(PinjamMobilFailed());
        }
      } catch (e) {
        log('PinjamMobilBlocCatch: $e');
      }
    });
  }
}
