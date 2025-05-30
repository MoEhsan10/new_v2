import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/config/theme/app_styles.dart';
import '../../../../shared/core/utils/colors_manager.dart';


class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String _selectedLanguage = 'en';

  final Map<String, String> _languages = {
    'en': 'English',
    'ar': 'Arabic',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Language', style: AppStyles.settingsLabel),
          SizedBox(height: 10.h),
          DropdownButtonFormField<String>(
            value: _selectedLanguage,
            onChanged: (newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedLanguage = newValue;
                });
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorsManager.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: ColorsManager.green,
                  width: 1.5,
                ),
              ),
              focusedBorder:const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: ColorsManager.green,
                  width: 2,
                ),
              ),
            ),
            style: TextStyle(
              color: ColorsManager.green,
              fontSize: 16.sp,
            ),
            dropdownColor: ColorsManager.white,
            items: _languages.entries.map((entry) {
              return DropdownMenuItem<String>(
                value: entry.key,
                child: Text(entry.value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
