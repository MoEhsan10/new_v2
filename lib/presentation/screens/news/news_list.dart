import 'package:flutter/material.dart';
import 'package:news_v2/data/api/api_manager/api_manager.dart';
import 'package:news_v2/presentation/screens/widgets/error_indicator.dart';
import 'package:news_v2/presentation/screens/widgets/loading_indicator.dart';

import '../../../data/api/reponses/news/NewsResponse.dart';
import 'news_item.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key,required this.sourceId});

final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(widget.sourceId),
      builder: (context, snapshot) {

        print('Status: ${snapshot.data?.status}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data?.news ?? [];
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) => NewsItem(news: newsList[index]),
          );
        }
      },
    );


  }
}
