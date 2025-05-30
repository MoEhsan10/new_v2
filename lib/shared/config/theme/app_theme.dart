import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors_manager.dart';

class AppTheme {
 static final ThemeData light = ThemeData(
  appBarTheme: AppBarTheme(
   color: ColorsManager.green,
   foregroundColor: ColorsManager.white,
   shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r)),
   ),
   // iconTheme: IconThemeData(
   //  color: ColorsManager.white, // Change the side menu icon color here
   // ),
  ),
  scaffoldBackgroundColor: Colors.transparent,
  drawerTheme: const DrawerThemeData(
   backgroundColor: ColorsManager.white,
  ),
 );
}