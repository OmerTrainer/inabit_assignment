import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/repositories/article_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _articleRepository;
  ArticleBloc(this._articleRepository) : super(ArticleInitial()) {
    on<FetchArticles>(_fetchArticles);
  }

  void _fetchArticles(FetchArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoadingState());

    try {
      List<ArticleModel> news = await _articleRepository.getAllArticles();
      emit(ArticleSuccessState(news: news));
    } catch (e) {
      emit(ArticleFailedState());
    }
  }
}
