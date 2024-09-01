part of 'notification_car_detail_bloc.dart';

sealed class NotificationCarDetailState extends Equatable {
  const NotificationCarDetailState();

  @override
  List<Object> get props => [];
}

final class NotificationCarDetailInitial extends NotificationCarDetailState {}

final class NotificationCarDetailLoading extends NotificationCarDetailState {}

final class NotificationCarDetailSuccess extends NotificationCarDetailState {
  const NotificationCarDetailSuccess({required this.carData});

  final NotificationDetailCarData carData;
}

final class NotificationCarDetailFailed extends NotificationCarDetailState {}
