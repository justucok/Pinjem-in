import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/notification_service.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_response.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<LoadNotification>((event, emit) async {
      emit(NotificationLoading());

      try {
        final response = await NotificationService.getNotification();

        if (response.status == 200) {
          emit(NotificationSuccess(notification: response.data!));
        } else {
          emit(NotificationFailed());
        }
      } catch (e) {
        log('Notif Catch: $e');
      }
    });
  }
}
