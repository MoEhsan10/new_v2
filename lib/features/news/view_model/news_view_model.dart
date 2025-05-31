import 'package:flutter/material.dart';
import 'package:news_v2/features/news/data/models/news.dart';
import 'package:news_v2/features/news/data/repositories/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  final repository = NewsRepository();

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
