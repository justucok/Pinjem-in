part of 'room_by_id_bloc.dart';

sealed class RoomByIdEvent extends Equatable {
  const RoomByIdEvent();

  @override
  List<Object> get props => [];
}

final class LoadRoomById extends RoomByIdEvent {
  const LoadRoomById({required this.id});

  final String id;
}
