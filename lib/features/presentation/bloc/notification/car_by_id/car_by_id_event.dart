part of 'car_by_id_bloc.dart';

sealed class CarByIdEvent extends Equatable {
  const CarByIdEvent();

  @override
  List<Object> get props => [];
}

final class LoadCarById extends CarByIdEvent {
  const LoadCarById({required this.id});

  final String id;
}
