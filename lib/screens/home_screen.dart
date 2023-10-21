import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inabit_assignment/bloc/bloc_exports.dart';
import 'package:inabit_assignment/bloc/language_bloc/language_bloc.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/widgets/latest_news.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Omer News App'),
        actions: [
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              if (state is LanguageSucces) {
                Map<String, String> languages = state.languages;
                return PopupMenuButton(
                  itemBuilder: (context) {
                    return List.generate(
                      languages.length,
                      (index) {
                        String visibleText = languages.keys.toList()[index];
                        String value =
                            languages[languages.keys.toList()[index]]!;

                        return PopupMenuItem<String>(
                          value: value,
                          child: Text(visibleText),
                        );
                      },
                    );
                  },
                  onSelected: (value) {
                    print(value);
                    context
                        .read<ArticleBloc>()
                        .add(FetchArticles(language: value));
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          IconButton(
            onPressed: () =>
                context.read<GoogleAuthBloc>().add(const GoogleAuthSignOut()),
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      body: const LatestNews(),
    );
  }
}
