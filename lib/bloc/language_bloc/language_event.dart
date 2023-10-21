part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class FetchLanguages extends LanguageEvent {
  const FetchLanguages();

  @override
  List<Object> get props => [];
}
