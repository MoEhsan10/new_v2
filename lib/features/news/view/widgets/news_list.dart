import 'package:flutter/material.dart';
import 'package:news_v2/features/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/error_indicator.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import 'news_item.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key,required this.sourceId});

final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  final viewModel = NewsViewModel();


  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(create: (context) => viewModel,
    child:
    Consumer<NewsViewModel>(builder: (_, viewModel, __) {
      if (viewModel.isLoading) {
      return const LoadingIndicator();
    } else if (viewModel.errorMessage !=null) {
      return const ErrorIndicator();
    } else {
      final newsList = viewModel.newsList;
      return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) => NewsItem(news: newsList[index]),
      );
    }
    },
    ),
    );
  }
}
// return FutureBuilder<NewsResponse>(
//   future: ApiManager.getNews(widget.sourceId),
//   builder: (context, snapshot) {
//
//     print('Status: ${snapshot.data?.status}');
//
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const LoadingIndicator();
//     } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
//       return const ErrorIndicator();
//     } else {
//       final newsList = snapshot.data?.news ?? [];
//       return ListView.builder(
//         itemCount: newsList.length,
//         itemBuilder: (context, index) => NewsItem(news: newsList[index]),
//       );
//     }
//   },
// );