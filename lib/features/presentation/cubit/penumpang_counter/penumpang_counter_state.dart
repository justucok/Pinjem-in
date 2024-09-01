part of 'penumpang_counter_cubit.dart';

sealed class PenumpangCounterState extends Equatable {
  const PenumpangCounterState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
final class PenumpangCounterInitial extends PenumpangCounterState {
  PenumpangCounterInitial({required this.countValue});

  late int countValue;
}
