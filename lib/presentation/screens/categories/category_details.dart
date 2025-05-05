import 'package:flutter/material.dart';
import 'package:news_v2/models/source/source_model.dart';
import 'package:news_v2/presentation/screens/sources_tab/sources_tab.dart';

class CategoryDetails extends StatefulWidget {
   CategoryDetails ({super.key,required this.categoryId});

  String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Source> sources =List.generate(10, (index)=>Source(id: '$index', name: 'source$index'));
  @override
  Widget build(BuildContext context) {
    return SourcesTab(sources: sources,);
  }
}
