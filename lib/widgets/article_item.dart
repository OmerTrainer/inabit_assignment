import 'package:flutter/material.dart';
import 'package:inabit_assignment/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(article.title),
          Image.network(
            article.image,
            fit: BoxFit.fitWidth,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              article.date.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
