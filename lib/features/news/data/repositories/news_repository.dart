import 'package:news_v2/features/news/data/data_sources/news_api_data_source.dart';
import 'package:news_v2/features/news/data/models/news.dart';

class NewsRepository {

  final dataSource =NewsApiDataSource();

  Future<List<News>> getNews(String sourceId)async {
    return dataSource.getNews(sourceId);
  }
}
