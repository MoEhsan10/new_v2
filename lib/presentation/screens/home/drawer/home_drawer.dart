import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_v2/config/theme/app_styles.dart';
import 'package:news_v2/core/utils/colors_manager.dart';

class HomeDrawer extends StatelessWidget {
   HomeDrawer({required this.onItemSelected});

  void Function(DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: screenSize.width*0.7,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: screenSize.height*0.2,
            alignment: Alignment.center,
            color: ColorsManager.green,
            child: Text('News App!',style: AppStyles.drawerTitle,),
          ),
          Expanded(
            child: Container(
              color: ColorsManager.white,
              child: Padding(
                padding:  REdgeInsetsDirectional.only(top: 12,start: 12),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => onItemSelected(DrawerItem.categories),
                      child: Row(
                        children: [
                          Icon(Icons.menu),
                          Text('Categories',style: AppStyles.drawerItem,),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    GestureDetector(
                      onTap: () => onItemSelected(DrawerItem.settings),
                      child: Row(
                        children: [
                          Icon(Icons.settings),
                          Text('Settings',style: AppStyles.drawerItem,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
enum DrawerItem{
  categories,
  settings,
}