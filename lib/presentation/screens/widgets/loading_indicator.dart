import 'package:flutter/material.dart';
import 'package:news_v2/core/utils/colors_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.green,
      ),
    );
  }
}
