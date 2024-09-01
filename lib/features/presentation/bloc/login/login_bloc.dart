import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/auth_service.dart';
import 'package:pinjem_in_app/features/auth/data/body/login_body.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<UserLogin>(
      (event, emit) async {
        emit(LoginLoading());

        try {
          final result = await AuthService.postLogin(event.body);

          if (result.data != null) {
            log(result.data!.email);
            emit(LoginSuccess());
          } else {
            emit(LoginFailed(message: result.message));
          }
        } catch (e) {
          log('Login Bloc Catch: $e');
        }
      },
    );
  }
}
