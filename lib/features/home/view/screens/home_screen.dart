import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_v2/features/search/view/widgets/custom_search_delegate.dart';

import '../../../../shared/config/theme/app_styles.dart';
import '../../../../shared/core/utils/assets_manager.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../categories/view/widgets/categories_grid.dart';
import '../../../categories/view/widgets/category_details.dart';
import '../../../settings/view/widgets/settings_tab.dart';
import '../widgets/home_drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem =DrawerItem.categories;
  CategoryModel? selectedCategory;
  @override

  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage(AssetsManager.bgPattern)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory != null
                ? selectedCategory!.name
                : selectedDrawerItem == DrawerItem.categories ?
            'News App': 'Settings',style: AppStyles.appBar,),
          centerTitle: true,
          actions: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20,),
              child: IconButton(onPressed: () => showSearch(context: context,delegate:CustomSearchDelegate() ), icon: const Icon(Icons.search,size: 32,)),
            ),
          ],
        ),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
        body: selectedCategory != null ? CategoryDetails(categoryId: selectedCategory!.id,)
            : selectedDrawerItem == DrawerItem.categories
            ?  CategoriesGrid(onCategorySelected: onCategoryItemSelected,) : const SettingsTab(),
      ),
    );
  }


  void onDrawerItemSelected(DrawerItem item){
    selectedDrawerItem= item;
    selectedCategory =null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategoryItemSelected(CategoryModel category){
    selectedCategory =category;
    setState(() {});
  }
}
