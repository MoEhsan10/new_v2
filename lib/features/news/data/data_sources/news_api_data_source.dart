import 'dart:convert';

import 'package:news_v2/features/news/data/models/news.dart';

import '../../../../shared/core/utils/api_constants.dart';
import '../models/NewsResponse.dart';
import 'package:http/http.dart' as http;

class NewsApiDataSource {
   Future<List<News>> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint,
        {
          'apiKey': ApiConstants.apiKey,
          'sources': sourceId,
        }
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok') {
     return newsResponse.news;
    } else {
      throw Exception('Failed to get news');
    }
  }
}