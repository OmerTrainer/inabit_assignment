import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inabit_assignment/bloc/bloc_exports.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/utils/device_utils.dart';
import 'package:inabit_assignment/widgets/article_item.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Omer News App'),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<GoogleAuthBloc>().add(const GoogleAuthSignOut()),
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('categories'),
            SizedBox(
              height: DeviceUtils.getScaledHeight(context, 0.1),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    //TODO implement filter by category
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      color: Colors.grey,
                      child: const Center(
                        child: Text('categoryName'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Text('latest news'),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ArticleItem(
                    article: ArticleModel(
                      id: 234,
                      title: 'vdsvdsvds',
                      date: DateTime.now(),
                      author: 'author',
                      description: 'description',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf7cjBh8rg0Pbd7o0YmzdiVtvQSFGFo3AIeCrFI494&s',
                      language: 'language',
                      url: 'url',
                      category: [],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
