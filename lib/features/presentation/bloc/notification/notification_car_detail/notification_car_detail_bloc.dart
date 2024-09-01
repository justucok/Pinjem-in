import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/notification_service.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_detail_car_response.dart';

part 'notification_car_detail_event.dart';
part 'notification_car_detail_state.dart';

class NotificationCarDetailBloc
    extends Bloc<NotificationCarDetailEvent, NotificationCarDetailState> {
  NotificationCarDetailBloc() : super(NotificationCarDetailInitial()) {
    on<LoadNotificationCarDetail>((event, emit) async {
      emit(NotificationCarDetailLoading());

      try {
        final response =
            await NotificationService.getDetailCarResponse(event.id);

        if (response.status == 200) {
          emit(NotificationCarDetailSuccess(carData: response.data!));
        } else {
          emit(NotificationCarDetailFailed());
        }
      } catch (e) {
        log('carNotifDetailCatch: $e');
      }
    });
  }
}
