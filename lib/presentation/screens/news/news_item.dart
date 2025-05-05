import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_v2/config/theme/app_styles.dart';
import 'package:news_v2/core/utils/assets_manager.dart';
import 'package:news_v2/presentation/screens/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 15));

    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: CachedNetworkImage(
              imageUrl: AssetsManager.football,
              height: MediaQuery.sizeOf(context).height*0.25,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: LoadingIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined),
            ),
          ),
          SizedBox(height: 8.h),
          Text('BBC News', style: AppStyles.sourceName,),
          SizedBox(height: 4.h),
          Text("Why are football's biggest clubs starting a new tournament?", style: AppStyles.articleTitle,),
          SizedBox(height: 2.h),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(fifteenAgo),
              style: AppStyles.sourceName.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
