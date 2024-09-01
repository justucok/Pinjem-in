import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/sharedpreference.dart';

part 'user_id_pref_event.dart';
part 'user_id_pref_state.dart';

class UserIdPrefBloc extends Bloc<UserIdPrefEvent, UserIdPrefState> {
  UserIdPrefBloc() : super(UserIdPrefInitial()) {
    on<LoadUserIdPref>((event, emit) async {
      try {
        final response = await SharedPrefStore.getUserId();

        if (response != null) {
          emit(UserIdPrefAvailable(userId: response));
        } else {
          emit(UserIdPrefUnavailable());
        }
      } catch (e) {
        log('User Id Catch: $e');
      }
    });
  }
}
