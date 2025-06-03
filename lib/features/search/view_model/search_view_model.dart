import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_v2/features/search/data/repositires/search_repository.dart';
import 'package:news_v2/features/search/view_model/search_state.dart';
import 'package:news_v2/shared/core/utils/service_locator.dart';

class SearchViewModel extends Cubit<SearchState>{
  late final SearchRepository repository;

  SearchViewModel() :super(SearchInitial()){
    repository = SearchRepository(dataSource: ServiceLocator.searchDataSource);
  }

  Future<void> getSearch(String query) async {
    emit(GetSearchLoading());
    try {
      final newsList = await repository.getSearch(query);
      emit(GetSearchSuccess(newsList: newsList));
    } catch (error) {
      emit(GetSearchError(errorMessage: error.toString()));
    }
  }


}