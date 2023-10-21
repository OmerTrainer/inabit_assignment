import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:inabit_assignment/bloc/bloc_exports.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/repositories/article_repository.dart';
import 'package:inabit_assignment/screens/article_details_screen.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends HydratedBloc<ArticleEvent, ArticleState> {
  final ArticleRepository _articleRepository;
  ArticleBloc(this._articleRepository) : super(const ArticleState()) {
    on<FetchArticles>(_fetchArticles);
    on<ChoseArticle>(_choseArticle);
  }

  void _fetchArticles(FetchArticles event, Emitter<ArticleState> emit) async {
    if (state.status == ArticleStatus.success && event.language.isEmpty) return;
    emit(const ArticleState(news: [], status: ArticleStatus.loading));
    try {
      List<ArticleModel> news =
          await _articleRepository.getAllArticles(language: event.language);
      emit(ArticleState(news: news, status: ArticleStatus.success));
    } catch (e) {
      emit(const ArticleState(news: [], status: ArticleStatus.error));
    }
  }

  void _choseArticle(ChoseArticle event, Emitter<ArticleState> emit) async {
    Navigator.of(event.context)
        .pushNamed(ArticleDetailsScreen.routeName, arguments: event.article);
  }

  @override
  ArticleState? fromJson(Map<String, dynamic> json) {
    return ArticleState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ArticleState state) {
    return state.toJson();
  }
}
