part of 'post_pinjam_mobil_bloc.dart';

sealed class PostPinjamMobilState extends Equatable {
  const PostPinjamMobilState();

  @override
  List<Object> get props => [];
}

final class PostPinjamMobilInitial extends PostPinjamMobilState {}

final class PostPinjamMobilLoading extends PostPinjamMobilState {}

final class PostPinjamMobilSuccess extends PostPinjamMobilState {}

final class PostPinjamMobilFailed extends PostPinjamMobilState {}
