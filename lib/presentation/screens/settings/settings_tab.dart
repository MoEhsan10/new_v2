import 'package:flutter/material.dart';
import 'package:news_v2/config/theme/app_styles.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings',style: AppStyles.picCategory,),
    );
  }
}
