import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_const.dart';

class BlottLabelTitle extends StatelessWidget {
  const BlottLabelTitle({
    super.key,
    required this.title,
    this.maxLines = 1,
  });

  final String title;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
          fontSize: 30.sp,
          color: BlottColors.textTitleColor,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
