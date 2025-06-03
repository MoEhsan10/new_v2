import 'package:news_v2/features/news/data/models/news.dart';
import 'package:news_v2/features/search/data/data_source/search_data_source.dart';

class SearchRepository {

  final SearchDataSource dataSource;
  SearchRepository({required this.dataSource});

  Future<List<News>> getSearch(String query)async{
    return dataSource.getSearch(query);
  }

}