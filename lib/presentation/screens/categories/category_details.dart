import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
   CategoryDetails ({super.key,required this.categoryId});

  String categoryId;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Category Details'),
    );
  }
}
