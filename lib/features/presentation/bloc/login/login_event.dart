part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class UserLogin extends LoginEvent {
  const UserLogin({
    required this.body,
  });

  final LoginBody body;
}
