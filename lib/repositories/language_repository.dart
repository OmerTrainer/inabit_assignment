import 'dart:convert';

import 'package:http/http.dart';

class LanguageRepository {
  String baseUrl = 'https://api.currentsapi.services/v1';

  Future<Map<String, String>> getAllLanguages() async {
    Map<String, String> languages = {};
    Response response = await get(
      Uri.parse('$baseUrl/available/languages'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data['languages'].forEach((key, value) {
        languages[key] = value.toString();
      });
    }
    return languages;
  }
}
