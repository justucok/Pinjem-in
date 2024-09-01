import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/room_service.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_detail_room_list_response.dart';

part 'room_by_id_event.dart';
part 'room_by_id_state.dart';

class RoomByIdBloc extends Bloc<RoomByIdEvent, RoomByIdState> {
  RoomByIdBloc() : super(RoomByIdInitial()) {
    on<LoadRoomById>((event, emit) async {
      emit(RoomByIdLoading());
      try {
        final response = await RoomService.getRoomById(event.id);
        if (response.status == 200) {
          emit(RoomByIdSuccess(roomById: response.data!));
        } else {
          emit(RoomByIdFailed());
        }
      } catch (e) {
        log('RoomByIdCatch: $e');
      }
    });
  }
}
