
import 'package:flutter/material.dart';
import 'package:news_v2/presentation/screens/news/new_details_screen.dart';

import '../../presentation/screens/home/home_screen.dart';

class RoutesManager{
  static const String homeRoute='/home';
  static const String newsDetailsRoute='/newsDetails';

  static Route? router(RouteSettings settings){
    switch(settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);
      case newsDetailsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const NewDetailsScreen(),);

    }
    return null;

  }
}