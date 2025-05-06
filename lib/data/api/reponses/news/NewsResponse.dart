import 'news.dart';

class NewsResponse {
  final String status;
  final int totalResults;
  final List<News> news;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.news,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] as String? ?? 'error',            // fallback
      totalResults: json['totalResults'] as int? ?? 0,         // fallback
      news: (json['articles'] as List<dynamic>?)
          ?.map((item) => News.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }
}
