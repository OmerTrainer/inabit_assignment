import 'package:flutter/material.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/utils/device_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const routeName = '/ArticleDetailsScreen';
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ArticleModel selectedArticle =
        ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedArticle.title),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.star_border_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(selectedArticle.title),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedArticle.author),
                  Text(selectedArticle.date.toString())
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.network(
                selectedArticle.image,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: SizedBox(
                    height: DeviceUtils.getScaledHeight(context, 0.15),
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(selectedArticle.description),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Related categories'),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                  childAspectRatio: 2 / 1,
                ),
                itemCount: selectedArticle.category.length,
                itemBuilder: (context, index) => Container(
                  height: DeviceUtils.getScaledHeight(context, 0.1),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      selectedArticle.category[index],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                child: Text(selectedArticle.url),
                onPressed: () async {
                  String url = selectedArticle.url;
                  var uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.inAppWebView);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
