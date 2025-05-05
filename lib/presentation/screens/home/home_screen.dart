import 'package:flutter/material.dart';
import 'package:news_v2/config/theme/app_styles.dart';
import 'package:news_v2/models/category/category_model.dart';
import 'package:news_v2/presentation/screens/categories/categories_grid.dart';
import 'package:news_v2/presentation/screens/categories/category_details.dart';
import 'package:news_v2/presentation/screens/home/drawer/home_drawer.dart';
import 'package:news_v2/presentation/screens/settings/settings_tab.dart';
import '../../../core/utils/assets_manager.dart';


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
          title: Text('News App',style: AppStyles.appBar,),
          centerTitle: true,
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
