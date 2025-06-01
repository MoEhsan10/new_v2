import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_v2/features/news/data/repositories/news_repository.dart';
import 'package:news_v2/features/news/view_model/news_state.dart';
import 'package:news_v2/shared/core/utils/service_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
 late final NewsRepository repository ;

 NewsViewModel() : super(NewsInitial()){
   repository = NewsRepository(dataSource: ServiceLocator.newsDataSource);
 }



  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      final newsList = await repository.getNews(sourceId);
      emit(GetNewsSuccess(newsList: newsList));
    } catch (error) {
      emit(GetNewsError(errorMessage: error.toString()));
    }
  }

}
