import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_const.dart';

class BlottLabelCustom extends StatelessWidget {
  const BlottLabelCustom({
    super.key,
    required this.title,
    required this.size,
    this.maxLines = 1,
    this.color = BlottColors.textTitleColor,
    this.fontWeight = FontWeight.w700,
  });

  final String title;
  final double size;
  final int maxLines;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontWeight: fontWeight,
        fontSize: size.sp,
        color: color,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
