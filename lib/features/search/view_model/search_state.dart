import '../../news/data/models/news.dart';

abstract class SearchState {}

class SearchInitial extends SearchState{}

class GetSearchLoading extends SearchState{}

class GetSearchSuccess extends SearchState{
  final List<News> newsList;
  GetSearchSuccess({required this.newsList});
}

class GetSearchError extends SearchState{
  final String? errorMessage;
  GetSearchError({this.errorMessage});
}