part of 'notification_room_detail_bloc.dart';

sealed class NotificationRoomDetailState extends Equatable {
  const NotificationRoomDetailState();

  @override
  List<Object> get props => [];
}

final class NotificationRoomDetailInitial extends NotificationRoomDetailState {}

final class NotificationRoomDetailLoading extends NotificationRoomDetailState {}

final class NotificationRoomDetailSuccess extends NotificationRoomDetailState {
  const NotificationRoomDetailSuccess({required this.roomData});

  final NotificationDetailRoomData roomData;
}

final class NotificationRoomDetailFailed extends NotificationRoomDetailState {}
