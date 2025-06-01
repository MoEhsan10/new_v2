import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_v2/features/sources/data/repositries/sources_repository.dart';
import 'package:news_v2/features/sources/view_model/sources_states.dart';
import 'package:news_v2/shared/core/utils/service_locator.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
 late final SourcesRepository repository;

 SourcesViewModel() : super(SourcesInitial()){
   repository= SourcesRepository(dataSource: ServiceLocator.sourcesDataSource);
 }


Future<void> getSources(String categoryId)async{

   emit(GetSourcesLoading());

  try{
      final sources = await repository.getSources(categoryId);
      emit(GetSourcesSuccess(sources:sources ));
    }catch(error){
    emit(GetSourcesError(errorMessage: error.toString()));
  }

 }
}