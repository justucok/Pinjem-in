import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/profile_service.dart';
import 'package:pinjem_in_app/features/profile/data/response/get_profile_response.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc() : super(GetUserInitial()) {
    on<LoadUserData>((event, emit) async {
      try {
        final result = await UserProfileService.getUserApiData(event.id);

        if (result.status == 200) {
          emit(GetUserLoaded(users: result.data));
        } else {
          log('Failed');
          emit(const GetUserError());
        }
      } catch (e) {
        log('Exception Caught $e');
      }
    });
  }
}
