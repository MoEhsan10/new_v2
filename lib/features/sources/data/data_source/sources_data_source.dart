import 'package:news_v2/features/sources/data/models/Source.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSources(String categoryId);
}