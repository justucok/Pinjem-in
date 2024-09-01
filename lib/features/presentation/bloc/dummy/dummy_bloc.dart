import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/dummy_service.dart';
import 'package:pinjem_in_app/features/home/data/response/dummy_mobil_response.dart';

part 'dummy_event.dart';
part 'dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
  DummyBloc() : super(DummyInitial()) {
    on<LoadDummyData>((event, emit) async {
      emit(DummyLoading());

      try {
        final response = await DummyService.getDataMobil();

        if (response.data != null) {
          emit(DummySuccess(mobilDummy: response.data));
        } else {
          emit(DummyFailed(message: response.message));
        }
      } catch (e) {
        log('catch: $e');
      }
    });
  }
}
