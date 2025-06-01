import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_v2/features/news/view_model/news_state.dart';
import 'package:news_v2/features/news/view_model/news_view_model.dart';
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
    return BlocProvider(create: (context) => viewModel,
    child:
    BlocBuilder<NewsViewModel,NewsState>
      (builder: (_, state,) {
      if (state is GetNewsLoading) {
      return const LoadingIndicator();
    } else if (state is GetNewsError) {
      return  ErrorIndicator(message: state.errorMessage,);
    } else if (state is GetNewsSuccess){
      final newsList = state.newsList;
      return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) => NewsItem(news: newsList[index]),
      );
    }else{
        return const SizedBox();
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