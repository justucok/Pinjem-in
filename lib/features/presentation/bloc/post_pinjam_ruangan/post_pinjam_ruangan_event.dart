part of 'post_pinjam_ruangan_bloc.dart';

sealed class PostPinjamRuanganEvent extends Equatable {
  const PostPinjamRuanganEvent();

  @override
  List<Object> get props => [];
}

final class PostDataPinjamRuangan extends PostPinjamRuanganEvent {
  const PostDataPinjamRuangan({required this.body});

  final PinjamRuanganBody body;
}
