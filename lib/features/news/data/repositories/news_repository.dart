import 'package:news_v2/features/news/data/data_sources/news_data_source.dart';
import 'package:news_v2/features/news/data/models/news.dart';

class NewsRepository {
 final NewsDataSource dataSource;
  NewsRepository({required this.dataSource});

  Future<List<News>> getNews(String sourceId)async {
    return dataSource.getNews(sourceId);
  }
}
