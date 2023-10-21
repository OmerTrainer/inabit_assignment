import 'dart:convert';

import 'package:http/http.dart';
import 'package:inabit_assignment/models/article_model.dart';
import 'package:inabit_assignment/repositories/firestore_repository.dart';

class ArticleRepository {
  String baseUrl = 'https://api.currentsapi.services/v1';
  String searchBaseUrl = 'https://api.currentsapi.services/v1/search';
  Future<List<ArticleModel>> getAllArticles({String language = ''}) async {
    //everytime data is fetched i check for new apikey instead of a change
    String apiKey = await FireStoreRepository().retrieveApiKey();
    List<ArticleModel> news = [];
    Response response = await get(
      Uri.parse(language.isNotEmpty
          ? '$searchBaseUrl?language=$language&apiKey=$apiKey'
          : '$baseUrl/latest-news?apiKey=$apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      for (int i = 0; i < (data["news"] as List).length; i++) {
        news.add(ArticleModel.fromJson(data["news"][i]));
      }
    }
    return news;
  }

  Future<List<Map<String, String>>> getAllLanguages() async {
    List<Map<String, String>> languages = [];
    Response response = await get(
      Uri.parse('$baseUrl/available/languages'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      languages = data['languages'];
    }
    return languages;
  }
}
