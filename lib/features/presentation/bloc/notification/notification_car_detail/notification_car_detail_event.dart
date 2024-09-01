part of 'notification_car_detail_bloc.dart';

sealed class NotificationCarDetailEvent extends Equatable {
  const NotificationCarDetailEvent();

  @override
  List<Object> get props => [];
}

final class LoadNotificationCarDetail extends NotificationCarDetailEvent {
  const LoadNotificationCarDetail({required this.id});

  final String id;
}
