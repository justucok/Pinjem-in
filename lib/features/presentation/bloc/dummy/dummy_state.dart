part of 'dummy_bloc.dart';

sealed class DummyState extends Equatable {
  const DummyState();

  @override
  List<Object> get props => [];
}

final class DummyInitial extends DummyState {}

final class DummyLoading extends DummyState {}

final class DummySuccess extends DummyState {
  const DummySuccess({this.mobilDummy});
  final List<DummyMobilData>? mobilDummy;
}

final class DummyFailed extends DummyState {
  const DummyFailed({required this.message});
  final String? message;
}
