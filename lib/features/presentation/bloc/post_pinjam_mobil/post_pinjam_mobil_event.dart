part of 'post_pinjam_mobil_bloc.dart';

sealed class PostPinjamMobilEvent extends Equatable {
  const PostPinjamMobilEvent();

  @override
  List<Object> get props => [];
}

final class PostDataPinjamMobil extends PostPinjamMobilEvent {
  const PostDataPinjamMobil({required this.body});

  final PinjamMobilBody body;
}
