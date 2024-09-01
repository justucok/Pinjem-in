import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/auth_service.dart';
import 'package:pinjem_in_app/features/auth/data/body/register_body.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<PostRegister>((event, emit) async {
      emit(RegisterLoading());
      try {
        final result = await AuthService.postRegister(event.body);

        if (result.status == 200) {
          emit(RegisterSuccess(message: result.message));
        } else {
          emit(RegisterFailed(mesage: result.message));
        }
      } catch (e) {
        log('Register Catch: $e');
      }
    });
  }
}
