part of 'pinjam_ruangan_bloc.dart';

sealed class PinjamRuanganState extends Equatable {
  const PinjamRuanganState();

  @override
  List<Object> get props => [];
}

final class PinjamRuanganInitial extends PinjamRuanganState {}

final class PinjamRuanganLoading extends PinjamRuanganState {}

final class PinjamRuanganSuccess extends PinjamRuanganState {
  const PinjamRuanganSuccess({this.pinjamRuanganData});

  final List<PinjamRuanganData>? pinjamRuanganData;
}

final class PinjamRuanganFailed extends PinjamRuanganState {}
