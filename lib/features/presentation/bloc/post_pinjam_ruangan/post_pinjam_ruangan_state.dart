part of 'post_pinjam_ruangan_bloc.dart';

sealed class PostPinjamRuanganState extends Equatable {
  const PostPinjamRuanganState();

  @override
  List<Object> get props => [];
}

final class PostPinjamRuanganInitial extends PostPinjamRuanganState {}

final class PostPinjamRuanganLoading extends PostPinjamRuanganState {}

final class PostPinjamRuanganSuccess extends PostPinjamRuanganState {}

final class PostPinjamRuanganFailed extends PostPinjamRuanganState {}
