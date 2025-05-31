import 'package:news_v2/features/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_v2/features/sources/data/models/Source.dart';

class SourcesRepository {
  final dataSource = SourcesApiDataSource();

  Future<List<Source>> getSources(String categoryId) async {
    return dataSource.getSources(categoryId);
  }

}
