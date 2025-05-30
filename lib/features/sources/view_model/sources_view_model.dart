import 'package:flutter/material.dart';
import 'package:news_v2/features/sources/data/data_source/sources_data_source.dart';
import 'package:news_v2/features/sources/data/models/Source.dart';

class SourcesViewModel with ChangeNotifier {
 final dataSources =SourcesDataSource();

List<Source> sources =[];
String? errorMessage;
bool isLoading =false;

Future<void> getSources(String categoryId)async{
  isLoading =true;
  notifyListeners();
  try{
      final response = await dataSources.getSources(categoryId);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!;
      } else {
        errorMessage = 'Failed to get sources';
      }
    }catch(error){
    errorMessage = error.toString();
  }
  isLoading =false;
  notifyListeners();
 }
}