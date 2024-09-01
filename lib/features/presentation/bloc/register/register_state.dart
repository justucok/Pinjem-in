part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess({required this.message});

  final String message;
}

final class RegisterFailed extends RegisterState {
  const RegisterFailed({required this.mesage});

  final String mesage;
}
