import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_v2/config/theme/app_styles.dart';
import 'package:news_v2/core/utils/assets_manager.dart';
import 'package:news_v2/core/utils/colors_manager.dart';
import 'package:news_v2/models/category/category_model.dart';
import 'package:news_v2/presentation/screens/categories/category_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = List.generate(
      6,
      (index) => CategoryModel(
          id: '12',
          name: 'sports',
          color: ColorsManager.red,
          imageName: AssetsManager.sports),
    );

    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Pick your category of interest',
              style: AppStyles.picCategory,
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) =>
                  CategoryItem(category: categories[index],index: index,),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 24, crossAxisSpacing: 24, crossAxisCount: 2),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
