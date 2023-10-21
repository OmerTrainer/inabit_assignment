part of 'article_bloc.dart';

enum ArticleStatus { initial, loading, success, error }

class ArticleState extends Equatable {
  final List<ArticleModel> news;
  final ArticleStatus status;
  const ArticleState({
    this.news = const [],
    this.status = ArticleStatus.initial,
  });
  factory ArticleState.fromJson(Map<String, dynamic> json) {
    return ArticleState(
      news: List<ArticleModel>.from(
        (json['news'] as List<dynamic>).map<ArticleModel>(
          (x) => ArticleModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
      status: ArticleStatus.values.firstWhere(
        (element) => element.name.toString() == json['status'],
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'news': news.map((x) => x.toJson()).toList(),
      'status': status.name
    };
  }

  @override
  List<Object> get props => [news, status];
}
