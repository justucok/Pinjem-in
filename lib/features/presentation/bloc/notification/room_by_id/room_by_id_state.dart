part of 'room_by_id_bloc.dart';

sealed class RoomByIdState extends Equatable {
  const RoomByIdState();

  @override
  List<Object> get props => [];
}

final class RoomByIdInitial extends RoomByIdState {}

final class RoomByIdLoading extends RoomByIdState {}

final class RoomByIdSuccess extends RoomByIdState {
  const RoomByIdSuccess({required this.roomById});

  final RoomByIdData roomById;
}

final class RoomByIdFailed extends RoomByIdState {}
