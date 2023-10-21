part of 'language_bloc.dart';

sealed class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

final class LanguageInitial extends LanguageState {}

class LanguageSucces extends LanguageState {
  final Map<String, String> languages;

  const LanguageSucces({required this.languages});

  @override
  List<Object> get props => [languages];
}

class LanguageFailed extends LanguageState {
  const LanguageFailed();

  @override
  List<Object> get props => [];
}
