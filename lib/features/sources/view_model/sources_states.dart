import 'package:news_v2/features/sources/data/models/Source.dart';

abstract class SourcesStates {}

class SourcesInitial extends SourcesStates{}

class GetSourcesLoading extends SourcesStates{}

class GetSourcesSuccess extends SourcesStates{
 final List<Source> sources;

 GetSourcesSuccess({required this.sources});

}

class GetSourcesError extends SourcesStates{
  final String? errorMessage;

  GetSourcesError({this.errorMessage});
}
