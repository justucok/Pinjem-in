part of 'user_id_pref_bloc.dart';

sealed class UserIdPrefEvent extends Equatable {
  const UserIdPrefEvent();

  @override
  List<Object> get props => [];
}

final class LoadUserIdPref extends UserIdPrefEvent {}
