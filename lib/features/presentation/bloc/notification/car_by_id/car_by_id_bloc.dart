import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/car_service.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_detail_car_list_response.dart';

part 'car_by_id_event.dart';
part 'car_by_id_state.dart';

class CarByIdBloc extends Bloc<CarByIdEvent, CarByIdState> {
  CarByIdBloc() : super(CarByIdInitial()) {
    on<LoadCarById>((event, emit) async {
      emit(CarByIdLoading());

      try {
        final response = await CarService.getCarById(event.id);
        if (response.status == 200) {
          emit(CarByIdSuccess(carByIdData: response.data!));
        } else {
          emit(CarByIdFailed());
        }
      } catch (e) {
        log('Car By Id Bloc Catch: $e');
      }
    });
  }
}
