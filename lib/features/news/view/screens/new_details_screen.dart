import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/config/theme/app_styles.dart';
import '../../../../shared/core/utils/assets_manager.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/news.dart';



class NewDetailsScreen extends StatelessWidget {
  const NewDetailsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    var news =ModalRoute.of(context)!.settings.arguments as News;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage(AssetsManager.bgPattern)),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(news.source?.name??''),
        ),
        body: Container(
          padding: REdgeInsets.symmetric(horizontal: 10, vertical: 30),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: news.urlToImage??'',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: CachedNetworkImage(
                          imageUrl: news.urlToImage ?? "https://i.sstatic.net/y9DpT.jpg",
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(child: LoadingIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(news.source?.name ?? '', style: AppStyles.sourceName),
                    SizedBox(height: 4.h),
                    Text(news.title ?? '', style: AppStyles.articleTitle),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        timeago.format(news.publishedAt!),
                        style: AppStyles.sourceName.copyWith(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Text(news.description ?? '', style: AppStyles.articleDescription),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: GestureDetector(
                  onTap: () async{await _launchUrl(news.url ?? '');},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View Full Article',
                        style: AppStyles.articleTitle.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri url1 =Uri.parse(url);
   try{
     await launchUrl(url1);
   }catch(e){

   }
  }
}
