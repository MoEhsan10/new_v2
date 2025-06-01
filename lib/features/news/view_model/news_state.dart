import 'package:news_v2/features/news/data/models/news.dart';

abstract class NewsState {}

class NewsInitial extends NewsState{}

class GetNewsLoading extends NewsState{}

class GetNewsSuccess extends NewsState{
 final List<News> newsList;
  GetNewsSuccess({required this.newsList});
}

class GetNewsError extends NewsState{
  final String? errorMessage;
  GetNewsError({this.errorMessage});
}