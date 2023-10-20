part of 'google_auth_bloc.dart';

sealed class GoogleAuthEvent extends Equatable {
  const GoogleAuthEvent();

  @override
  List<Object> get props => [];
}

class GoogleAuthLogin extends GoogleAuthEvent {
  const GoogleAuthLogin();

  @override
  List<Object> get props => [];
}

class GoogleAuthSignOut extends GoogleAuthEvent {
  const GoogleAuthSignOut();

  @override
  List<Object> get props => [];
}
