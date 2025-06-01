import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_v2/features/sources/view_model/sources_states.dart';
import 'package:news_v2/features/sources/view_model/sources_view_model.dart';
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
   return BlocProvider(create: (_) => viewModel,
     child: BlocBuilder<SourcesViewModel,SourcesStates>
       (builder: (_, state,) {
     if(state is GetSourcesLoading){
        return const LoadingIndicator();
      }else if(state is GetSourcesError){
        return ErrorIndicator(message: state.errorMessage,);
      }else if (state is GetSourcesSuccess){
        return SourcesTab(sources: state.sources,);
      }else{
       return const SizedBox();
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