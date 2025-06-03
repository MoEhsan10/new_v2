import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_v2/features/news/view/widgets/news_item.dart';
import 'package:news_v2/features/search/view_model/search_state.dart';
import 'package:news_v2/features/search/view_model/search_view_model.dart';
import 'package:news_v2/shared/widgets/error_indicator.dart';
import 'package:news_v2/shared/widgets/loading_indicator.dart';
import '../../../../shared/core/utils/colors_manager.dart';

class CustomSearchDelegate extends SearchDelegate {
  final viewModel = SearchViewModel();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: ()=>showResults(context), icon: const Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon:const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.trim().isNotEmpty) {
      viewModel.getSearch(query);
    }
    return BlocProvider(create: (context) =>viewModel ,
      child: BlocBuilder<SearchViewModel,SearchState>(builder: (context, state) {
        if(state is GetSearchLoading){
          return const LoadingIndicator();
        }else if(state is GetSearchError){
          return ErrorIndicator(message: state.errorMessage,);
        }else if(state is GetSearchSuccess){
          final newsList = state.newsList;
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) => NewsItem(news: newsList[index]),
          );
        }else{
          return const SizedBox();
        }
      },),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.trim().isNotEmpty) {
      viewModel.getSearch(query);
    }

    return BlocProvider(create: (context) =>viewModel ,
      child: BlocBuilder<SearchViewModel,SearchState>(builder: (context, state) {
        if(state is GetSearchLoading){
          return const LoadingIndicator();
        }else if(state is GetSearchError){
          return ErrorIndicator(message: state.errorMessage,);
        }else if(state is GetSearchSuccess){
          final newsList = state.newsList;
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) => NewsItem(news: newsList[index]),
          );
        }else{
          return const SizedBox();
        }
      },),
    );
  }

  @override
 ThemeData appBarTheme(BuildContext context) {
  return ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: ColorsManager.white),
      backgroundColor: ColorsManager.green,
      foregroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(borderSide: BorderSide.none),
      hintStyle: TextStyle(color: ColorsManager.white),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: ColorsManager.white, fontSize: 18.sp),
    ),
  );
}
}