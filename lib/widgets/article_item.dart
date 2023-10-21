import 'package:flutter/material.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/utils/device_utils.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
                child: CircularProgressIndicator.adaptive(),
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
    );
  }
}
