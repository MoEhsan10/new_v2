import 'package:flutter/material.dart';
import 'package:news_v2/features/news/data/data_sources/news_data_source.dart';
import 'package:news_v2/features/news/data/models/news.dart';

class NewsViewModel extends ChangeNotifier{
  final dataSource = NewsDataSource();

  List<News> newsList=[];
  String? errorMessage;
  bool isLoading =false;

  Future<void> getNews(String sourceId)async{
    isLoading=true;
    notifyListeners();
    try{
      final response = await dataSource.getNews(sourceId);
      if (response.status == 'ok') {
        newsList = response.news;
      } else {
        errorMessage = 'Failed to get news';
      }
    }catch(error){
      errorMessage=error.toString();
    }
    isLoading=false;
    notifyListeners();
  }
}