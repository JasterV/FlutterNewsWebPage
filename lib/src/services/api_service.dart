import 'dart:convert';
import 'package:flutter_news_web_page/keys.dart';
import 'package:flutter_news_web_page/src/models/article_model.dart';
import 'package:http/http.dart';

class APIService {
  static final String _baseUrl = 'api.nytimes.com';
  static const String _API_KEY = API_KEY; //Insert here your api key

  static Future<List<Article>> fetchArticlesBySection(String section) async {
    Map<String, String> parameters = {
      'api-key': _API_KEY,
    };
    Uri uri = Uri.http(
      _baseUrl,
      '/svc/topstories/v2/$section.json',
      parameters,
    );
    try {
      Response response = await get(uri);
      Map<String, dynamic> data = json.decode(response.body);
      List<Article> articles = (data['results'] as List).map(
        (articleMap) => Article.fromMap(articleMap),
      ).toList();
      return articles;
    } catch (err) {
      throw err.toString();
    }
  }
}
