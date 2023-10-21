import 'package:flutter/material.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/widgets/article_item.dart';

import '../bloc/bloc_exports.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        print(state.status);
        List<ArticleModel> news = state.news;
        if (state.status == ArticleStatus.error) {
          return const Center(child: Text('error'));
        }
        if (state.status == ArticleStatus.loading ||
            state.status == ArticleStatus.initial) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return news.isEmpty
            ? const Center(
                child: Text('no Articles Found'),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('latest news'),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: news.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ArticleItem(
                            article: news[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
