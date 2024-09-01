import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'penumpang_counter_state.dart';

class PenumpangCounterCubit extends Cubit<PenumpangCounterInitial> {
  PenumpangCounterCubit() : super(PenumpangCounterInitial(countValue: 0));

  void increment() {
    final value = state.countValue += 1;
    emit(PenumpangCounterInitial(countValue: value));
    log(value.toString());
  }

  void decrement() {
    final value = state.countValue -= 1;
    emit(PenumpangCounterInitial(countValue: value));
    log(value.toString());
  }
}
