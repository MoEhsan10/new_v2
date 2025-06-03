import 'package:news_v2/features/news/data/models/news.dart';

abstract class SearchDataSource {
  Future<List<News>> getSearch(String query);
}