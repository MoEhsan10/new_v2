import 'dart:convert';

import '../../../../shared/core/utils/api_constants.dart';
import '../models/NewsResponse.dart';
import 'package:http/http.dart' as http;

class NewsDataSource {
   Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint,
        {
          'apiKey': ApiConstants.apiKey,
          'sources': sourceId,
        }
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}