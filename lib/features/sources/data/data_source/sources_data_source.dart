import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/core/utils/api_constants.dart';
import '../models/SourcesResponse.dart';

class SourcesDataSource {

   Future<SourcesResponse> getSources(String categoryId) async {
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

}