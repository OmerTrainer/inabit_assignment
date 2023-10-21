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
  ArticleBloc(this._articleRepository) : super(ArticleInitial()) {
    on<FetchArticles>(_fetchArticles);
    on<ChoseArticle>(_choseArticle);
  }

  void _fetchArticles(FetchArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoadingState());
    try {
      List<ArticleModel> news =
          await _articleRepository.getAllArticles(language: event.language);
      emit(ArticleSuccessState(news: news));
    } catch (e) {
      emit(ArticleFailedState());
    }
  }

  void _choseArticle(ChoseArticle event, Emitter<ArticleState> emit) async {
    Navigator.of(event.context)
        .pushNamed(ArticleDetailsScreen.routeName, arguments: event.article);
  }

  @override
  ArticleState? fromJson(Map<String, dynamic> json) {
    return ArticleSuccessState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ArticleState state) {
    if (state is ArticleSuccessState) {
      return state.toJson();
    } else {
      return null;
    }
  }
}
