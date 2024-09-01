part of 'get_user_bloc.dart';

sealed class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

final class GetUserInitial extends GetUserState {}

final class GetUserLoaded extends GetUserState {
  const GetUserLoaded({this.users});

  final UserApiData? users;
}

final class GetUserError extends GetUserState {
  const GetUserError({this.errorMessage});

  final String? errorMessage;
}
