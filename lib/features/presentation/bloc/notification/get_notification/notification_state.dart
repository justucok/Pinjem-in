part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationSuccess extends NotificationState {
  const NotificationSuccess({required this.notification});

  final List<NotificationData> notification;
}

final class NotificationFailed extends NotificationState {}
