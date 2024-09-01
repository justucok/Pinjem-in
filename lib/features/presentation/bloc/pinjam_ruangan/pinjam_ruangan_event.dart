part of 'pinjam_ruangan_bloc.dart';

sealed class PinjamRuanganEvent extends Equatable {
  const PinjamRuanganEvent();

  @override
  List<Object> get props => [];
}

final class LoadPinjamRuangan extends PinjamRuanganEvent {}
