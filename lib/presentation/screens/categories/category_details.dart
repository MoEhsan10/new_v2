import 'package:flutter/material.dart';
import 'package:news_v2/data/api/api_manager/api_manager.dart';
import 'package:news_v2/presentation/screens/sources_tab/sources_tab.dart';
import 'package:news_v2/presentation/screens/widgets/error_indicator.dart';
import 'package:news_v2/presentation/screens/widgets/loading_indicator.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails ({super.key,required this.categoryId});

 final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  // List<Source> sources =List.generate(10, (index)=>Source(id: '$index', name: 'source$index'));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const LoadingIndicator();
          }else if(snapshot.hasError || snapshot.data?.status != 'ok'){
            return const ErrorIndicator();
          }else{
            final sources = snapshot.data?.sources ?? [];
            return SourcesTab(sources: sources,);
          }
        },
    );
  }
}
// snapshot -> current future state
