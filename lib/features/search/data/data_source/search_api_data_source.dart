import 'dart:convert';
import 'package:news_v2/features/search/data/data_source/search_data_source.dart';
import '../../../../shared/core/utils/api_constants.dart';
import '../../../news/data/models/NewsResponse.dart';
import '../../../news/data/models/news.dart';
import 'package:http/http.dart' as http;

class SearchApiDataSource extends SearchDataSource{
  @override
  Future<List<News>> getSearch(String query) async {

    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'q': query,
    });

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
