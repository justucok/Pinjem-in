part of 'hide_pass_cubit.dart';

sealed class HidePassState extends Equatable {
  const HidePassState();

  @override
  List<Object> get props => [];
}

final class HidePassOn extends HidePassState {}
final class HidePassOff extends HidePassState {}
