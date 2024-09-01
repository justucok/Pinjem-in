part of 'notification_room_detail_bloc.dart';

sealed class NotificationRoomDetailEvent extends Equatable {
  const NotificationRoomDetailEvent();

  @override
  List<Object> get props => [];
}

final class LoadNotificationRoomDetail extends NotificationRoomDetailEvent {
  const LoadNotificationRoomDetail({required this.id});

  final String id;
}
