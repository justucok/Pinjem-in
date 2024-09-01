part of 'login_pref_bloc.dart';

sealed class LoginPrefEvent extends Equatable {
  const LoginPrefEvent();

  @override
  List<Object> get props => [];
}

final class LoadLoginPref extends LoginPrefEvent {}
