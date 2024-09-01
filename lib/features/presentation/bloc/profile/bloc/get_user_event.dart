part of 'get_user_bloc.dart';

sealed class GetUserEvent extends Equatable {
  const GetUserEvent();

  @override
  List<Object> get props => [];
}

final class LoadUserData extends GetUserEvent {
  const LoadUserData({required this.id});

  final String id;
}
