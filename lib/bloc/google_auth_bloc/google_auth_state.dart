part of 'google_auth_bloc.dart';

sealed class GoogleAuthState extends Equatable {
  const GoogleAuthState();

  @override
  List<Object> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoading extends GoogleAuthState {}

class GoogleAuthSuccess extends GoogleAuthState {
  final User user;

  const GoogleAuthSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class GoogleAuthFailed extends GoogleAuthState {
  final String error;

  const GoogleAuthFailed({required this.error});

  @override
  List<Object> get props => [error];
}
