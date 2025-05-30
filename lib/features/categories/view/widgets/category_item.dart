import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/config/theme/app_styles.dart';
import '../../data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
 const CategoryItem({super.key, required this.category,required this.index});

  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius:BorderRadiusDirectional.only(
            topStart:  Radius.circular(25.r),
            topEnd:  Radius.circular(25.r),
            bottomStart: Radius.circular(index.isEven?20 :0),
            bottomEnd: Radius.circular(index.isOdd?20 :0),
          ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 132.w,
            height: 118.h,
            child: Image.asset(
              category.imageName,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            category.name,
            style: AppStyles.categoryTitle,
          ),
        ],
      ),
    );
  }
}