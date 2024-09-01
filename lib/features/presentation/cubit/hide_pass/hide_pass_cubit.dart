import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hide_pass_state.dart';

class HidePassCubit extends Cubit<HidePassState> {
  HidePassCubit() : super(HidePassOn());

  void hidePass() {
    emit(HidePassOn());
  }

  void showPass() {
    emit(HidePassOff());
  }
}
