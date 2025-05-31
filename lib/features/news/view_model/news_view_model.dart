import 'package:flutter/material.dart';
import 'package:news_v2/features/news/data/models/news.dart';
import 'package:news_v2/features/news/data/repositories/news_repository.dart';
import 'package:news_v2/shared/core/utils/service_locator.dart';

class NewsViewModel extends ChangeNotifier {
 late final NewsRepository repository ;

 NewsViewModel(){
   repository = NewsRepository(dataSource: ServiceLocator.newsDataSource);
 }

  List<News> newsList = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();

    try {
      newsList = await repository.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }

    isLoading = false;
    notifyListeners();
  }

}
