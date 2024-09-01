part of 'login_pref_bloc.dart';

sealed class LoginPrefState extends Equatable {
  const LoginPrefState();

  @override
  List<Object> get props => [];
}

final class LoginPrefInitial extends LoginPrefState {}

final class LoginPrefAvailable extends LoginPrefState {
  const LoginPrefAvailable({required this.token});

  final String token;
}

final class LoginPrefUnavailable extends LoginPrefState {}
