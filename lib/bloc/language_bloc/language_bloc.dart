import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inabit_assignment/repositories/language_repository.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepository _languageRepository;
  LanguageBloc(this._languageRepository) : super(LanguageInitial()) {
    on<FetchLanguages>(_fetchLanguages);
  }

  void _fetchLanguages(
      FetchLanguages event, Emitter<LanguageState> emit) async {
    try {
      Map<String, String> langs = await _languageRepository.getAllLanguages();

      emit(LanguageSucces(languages: langs));
    } catch (e) {
      emit(const LanguageFailed());
    }
  }
}
