part of 'pinjam_mobil_bloc.dart';

sealed class PinjamMobilState extends Equatable {
  const PinjamMobilState();

  @override
  List<Object> get props => [];
}

final class PinjamMobilInitial extends PinjamMobilState {}

final class PinjamMobilLoading extends PinjamMobilState {}

final class PinjamMobilSuccess extends PinjamMobilState {
  const PinjamMobilSuccess({this.pinjamMobilData});
  final List<PinjamMobilData>? pinjamMobilData;
}

final class PinjamMobilFailed extends PinjamMobilState {}
