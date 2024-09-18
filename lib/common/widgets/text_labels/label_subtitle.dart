import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_const.dart';

class BlottLabelSubtitle extends StatelessWidget {
  const BlottLabelSubtitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: BlottColors.textSubtitleTitleColor,
      ),
    );
  }
}
