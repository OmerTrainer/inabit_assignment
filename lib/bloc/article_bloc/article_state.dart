part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleSuccessState extends ArticleState {
  final List<ArticleModel> news;

  const ArticleSuccessState({required this.news});

  @override
  List<Object> get props => [news];
}

class ArticleFailedState extends ArticleState {}
