part of 'car_by_id_bloc.dart';

sealed class CarByIdState extends Equatable {
  const CarByIdState();

  @override
  List<Object> get props => [];
}

final class CarByIdInitial extends CarByIdState {}

final class CarByIdLoading extends CarByIdState {}

final class CarByIdSuccess extends CarByIdState {
  const CarByIdSuccess({required this.carByIdData});

  final CarByIdData carByIdData;
}

final class CarByIdFailed extends CarByIdState {}
