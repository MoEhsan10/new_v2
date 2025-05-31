import 'package:flutter/material.dart';
import 'package:news_v2/features/sources/data/models/Source.dart';
import 'package:news_v2/features/sources/data/repositries/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
 final repository =SourcesRepository();

List<Source> sources =[];
String? errorMessage;
bool isLoading =false;

Future<void> getSources(String categoryId)async{
  isLoading =true;
  notifyListeners();

  try{
       sources = await repository.getSources(categoryId);
    }catch(error){
    errorMessage = error.toString();
  }

  isLoading =false;
  notifyListeners();
 }
}