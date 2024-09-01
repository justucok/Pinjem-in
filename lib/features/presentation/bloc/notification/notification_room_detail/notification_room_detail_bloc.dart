import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/notification_service.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_detail_room_response.dart';

part 'notification_room_detail_event.dart';
part 'notification_room_detail_state.dart';

class NotificationRoomDetailBloc
    extends Bloc<NotificationRoomDetailEvent, NotificationRoomDetailState> {
  NotificationRoomDetailBloc() : super(NotificationRoomDetailInitial()) {
    on<LoadNotificationRoomDetail>((event, emit) async {
      emit(NotificationRoomDetailLoading());
      try {
        final response =
            await NotificationService.getDetailRoomResponse(event.id);

        if (response.status == 200) {
          emit(NotificationRoomDetailSuccess(roomData: response.data!));
        } else {
          emit(NotificationRoomDetailFailed());
        }
      } catch (e) {
        log('NotifRoomDetailBlocCatch: $e');
      }
    });
  }
}
