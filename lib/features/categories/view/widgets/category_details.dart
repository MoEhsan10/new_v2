import 'package:flutter/material.dart';
import 'package:news_v2/features/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/error_indicator.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../sources/view/widgets/sources_tab.dart';


class CategoryDetails extends StatefulWidget {
  const CategoryDetails ({super.key,required this.categoryId});

 final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  // List<Source> sources =List.generate(10, (index)=>Source(id: '$index', name: 'source$index'));
  final viewModel =SourcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(create: (_) => viewModel,
     child: Consumer<SourcesViewModel>
       (builder: (_, viewModel, __) {
     if(viewModel.isLoading){
        return const LoadingIndicator();
      }else if(viewModel.errorMessage != null){
        return const ErrorIndicator();
      }else{
        final sources = viewModel.sources;
        return SourcesTab(sources: sources,);
      }
     },
     ),
   );
  }
}

// snapshot -> current future state

// return FutureBuilder(
//     future: ApiManager.getSources(widget.categoryId),
//     builder: (context, snapshot) {
//       if(snapshot.connectionState == ConnectionState.waiting){
//         return const LoadingIndicator();
//       }else if(snapshot.hasError || snapshot.data?.status != 'ok'){
//         return const ErrorIndicator();
//       }else{
//         final sources = snapshot.data?.sources ?? [];
//         return SourcesTab(sources: sources,);
//       }
//     },
// );