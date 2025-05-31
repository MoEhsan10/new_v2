import 'package:news_v2/features/news/data/models/news.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews(String sourceId);
}