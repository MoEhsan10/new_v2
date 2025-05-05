import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_v2/config/theme/app_styles.dart';
import 'package:news_v2/core/utils/colors_manager.dart';

class TabItem extends StatelessWidget {
   TabItem({
     super.key,
     required this.sourceName,
     required this.isSelected
   });

String sourceName;
bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 8,horizontal: 16),
      margin: REdgeInsets.symmetric(vertical: 15,),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.green : Colors.transparent,
        border: Border.all(width: 2,color: ColorsManager.green,),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Text(sourceName,style: isSelected ? AppStyles.selectedLabel :
      AppStyles.unselectedLabel,)
      ,);
  }


}
