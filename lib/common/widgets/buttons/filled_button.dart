import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_const.dart';

class BlottButtonFilled extends TextButton {
  ///
  final Function() onPressedB;
  final String title;
  final double buttonHeight;
  final Color buttonColor;
  final Color titleColor;

  ///
  BlottButtonFilled({
    super.key,
    required this.onPressedB,
    required this.title,
    this.buttonHeight = 48.0,
    this.buttonColor = BlottColors.enabledButtonColor,
    this.titleColor = BlottColors.buttonLabelColor,
  }) : super(
          onPressed: onPressedB,
          child: Text(
            title,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: titleColor,
            fixedSize: Size.fromHeight(buttonHeight.h),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24.0),
              ),
            ),
          ),
        );
}
