import 'package:news_v2/features/news/data/data_sources/news_api_data_source.dart';
import 'package:news_v2/features/news/data/data_sources/news_data_source.dart';
import 'package:news_v2/features/search/data/data_source/search_api_data_source.dart';
import 'package:news_v2/features/search/data/data_source/search_data_source.dart';
import 'package:news_v2/features/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_v2/features/sources/data/data_source/sources_data_source.dart';

class ServiceLocator {
  static SourcesDataSource sourcesDataSource = SourcesApiDataSource();
  static NewsDataSource newsDataSource = NewsApiDataSource();
  static SearchDataSource searchDataSource = SearchApiDataSource();
}
