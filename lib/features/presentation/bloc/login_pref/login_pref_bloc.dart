import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/sharedpreference.dart';

part 'login_pref_event.dart';
part 'login_pref_state.dart';

class LoginPrefBloc extends Bloc<LoginPrefEvent, LoginPrefState> {
  LoginPrefBloc() : super(LoginPrefInitial()) {
    on<LoadLoginPref>((event, emit) async {
      try {
        final prefResponse = await SharedPrefStore.getBearerToken();

        if (prefResponse != null) {
          emit(LoginPrefAvailable(token: prefResponse));
        } else if (prefResponse == null) {
          emit(LoginPrefUnavailable());
        }
      } catch (e) {
        log('Pref Catch: $e');
      }
    });
  }
}
