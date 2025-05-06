import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_v2/data/api/api_manager/api_constants.dart';
import 'package:news_v2/data/api/reponses/news/NewsResponse.dart';
import 'package:news_v2/data/api/reponses/source/SourcesResponse.dart';

class ApiManager {

  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndPoint,
        {
          'apiKey': ApiConstants.apiKey,
          'category': categoryId,
        }
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint,
        {
          'apiKey': ApiConstants.apiKey,
          'sources': sourceId,
        }
    );
    final response =await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);


  }
}