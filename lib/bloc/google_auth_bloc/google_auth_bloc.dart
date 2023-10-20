import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inabit_assignment/repositories/google_auth_repository.dart';

part 'google_auth_event.dart';
part 'google_auth_state.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  final GoogleAuthRepository _googleAuthRepository;
  GoogleAuthBloc(this._googleAuthRepository) : super(GoogleAuthInitial()) {
    on<GoogleAuthLogin>(_googleLogin);
  }

  void _googleLogin(
      GoogleAuthEvent event, Emitter<GoogleAuthState> emit) async {
    emit(GoogleAuthLoading());

    try {
      User? user = await _googleAuthRepository.login();
      if (user == null) {
        emit(const GoogleAuthFailed(error: 'Failed To Login'));
      } else {
        emit(GoogleAuthSuccess(user: user));
      }
    } catch (e) {
      emit(GoogleAuthFailed(error: e.toString()));
    }
  }
}
