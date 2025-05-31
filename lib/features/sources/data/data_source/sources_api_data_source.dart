import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_v2/features/sources/data/models/Source.dart';
import '../../../../shared/core/utils/api_constants.dart';
import '../models/SourcesResponse.dart';

class SourcesApiDataSource {

   Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndPoint,
        {
          'apiKey': ApiConstants.apiKey,
          'category': categoryId,
        }
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Failed to get sources');
    }
  }

}