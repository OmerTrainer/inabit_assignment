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

  factory ArticleSuccessState.fromJson(Map<String, dynamic> json) {
    List<ArticleModel> news = [];
    for (var element in json.keys) {
      news.add(ArticleModel.fromJson(json[element]));
    }
    return ArticleSuccessState(news: news);
  }
  Map<String, dynamic> toJson() {
    return {'news': news};
  }

  @override
  List<Object> get props => [news];
}

class ArticleFailedState extends ArticleState {}
