part of 'pinjam_mobil_bloc.dart';

sealed class PinjamMobilEvent extends Equatable {
  const PinjamMobilEvent();

  @override
  List<Object> get props => [];
}

final class LoadPinjamMobilData extends PinjamMobilEvent {}
