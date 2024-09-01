part of 'dummy_bloc.dart';

sealed class DummyEvent extends Equatable {
  const DummyEvent();

  @override
  List<Object> get props => [];
}

final class LoadDummyData extends DummyEvent {}
