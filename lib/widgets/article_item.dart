import 'package:flutter/material.dart';
import 'package:inabit_assignment/bloc/bloc_exports.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/utils/device_utils.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<ArticleBloc>()
          .add(ChoseArticle(article: article, context: context)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(article.title),
              Image.network(
                article.image,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: SizedBox(
                    height: DeviceUtils.getScaledHeight(context, 0.15),
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  article.date.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
