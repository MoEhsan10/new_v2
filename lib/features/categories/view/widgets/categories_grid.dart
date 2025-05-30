import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/config/theme/app_styles.dart';
import '../../../../shared/core/utils/assets_manager.dart';
import '../../../../shared/core/utils/colors_manager.dart';
import '../../../../shared/core/utils/strings_manager.dart';
import '../../data/models/category_model.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
const CategoriesGrid({super.key,required this.onCategorySelected});

 final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(id: 'sports', name: StringManager.sports, color: ColorsManager.red, imageName: AssetsManager.sports),
      CategoryModel(id: 'general', name: StringManager.general, color: ColorsManager.navy, imageName: AssetsManager.general),
      CategoryModel(id: 'health', name: StringManager.health, color: ColorsManager.pink, imageName: AssetsManager.health),
      CategoryModel(id: 'business', name: StringManager.business, color: ColorsManager.brown, imageName: AssetsManager.business),
      CategoryModel(id: 'entertainment', name: StringManager.entertainment, color: ColorsManager.lightBLue, imageName: AssetsManager.entertainment),
      CategoryModel(id: 'science', name: StringManager.science, color: ColorsManager.yellow, imageName: AssetsManager.science),
    ];

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
                  GestureDetector(
                    onTap: () {onCategorySelected(categories[index]);},
                  child: CategoryItem(
                category: categories[index],
                index: index,
              )),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 24, crossAxisSpacing: 24, crossAxisCount: 2),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
