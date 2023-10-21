part of 'article_bloc.dart';

sealed class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class FetchArticles extends ArticleEvent {
  final String language;
  const FetchArticles({this.language = ''});

  @override
  List<Object> get props => [language];
}

class ChoseArticle extends ArticleEvent {
  final ArticleModel article;
  final BuildContext context;

  const ChoseArticle({required this.article, required this.context});

  @override
  List<Object> get props => [article];
}
