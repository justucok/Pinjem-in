part of 'user_id_pref_bloc.dart';

sealed class UserIdPrefState extends Equatable {
  const UserIdPrefState();

  @override
  List<Object> get props => [];
}

final class UserIdPrefInitial extends UserIdPrefState {}

final class UserIdPrefAvailable extends UserIdPrefState {
  const UserIdPrefAvailable({required this.userId});

  final String userId;
}

final class UserIdPrefUnavailable extends UserIdPrefState {}
