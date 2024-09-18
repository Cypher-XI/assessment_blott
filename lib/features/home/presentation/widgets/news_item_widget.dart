import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/news_model.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.newsData,
  });

  final NewsModel newsData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
