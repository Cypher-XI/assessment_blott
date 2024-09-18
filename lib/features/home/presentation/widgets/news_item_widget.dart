import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/color_const.dart';
import '../../../../common/constants/string_formats.dart';
import '../../../../common/widgets/text_labels/label_custom.dart';
import '../../data/model/news_model.dart';
import '../news_detail_screen.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.newsData,
  });

  final NewsModel newsData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(
          NewsDetailScreen.routeName,
          extra: newsData.url,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0.h,
          horizontal: 16.0.w,
        ),
        child: Row(
          children: [
            Image.network(
              newsData.thumbnail,
              width: 100.w,
              height: 100.w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: BlottLabelCustom(
                          title: newsData.source,
                          size: 12.0,
                          fontWeight: FontWeight.w400,
                          color: BlottColors.whiteColor.withOpacity(0.7),
                          maxLines: 1,
                        ),
                      ),
                      BlottLabelCustom(
                        title: StringFormats.dateFormat.format(
                          DateTime.fromMillisecondsSinceEpoch(
                            newsData.date * 1000,
                          ),
                        ),
                        size: 12.0,
                        fontWeight: FontWeight.w400,
                        color: BlottColors.whiteColor.withOpacity(0.7),
                      ),
                    ],
                  ),
                  BlottLabelCustom(
                    title: newsData.title,
                    size: 20.0,
                    fontWeight: FontWeight.w500,
                    color: BlottColors.whiteColor,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
