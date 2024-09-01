part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class PostRegister extends RegisterEvent {
  const PostRegister({required this.body});

  final RegisterBody body;
}
