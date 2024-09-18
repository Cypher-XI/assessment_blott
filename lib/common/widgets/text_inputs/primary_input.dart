import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_const.dart';

class BlottInputPrimary extends StatefulWidget {
  const BlottInputPrimary({
    super.key,
    required this.fieldName,
    required this.textInputTextEditController,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.inputHint,
    this.validator,
    this.autofocus = false,
  });

  final String fieldName;
  final TextEditingController textInputTextEditController;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? inputHint;
  final bool autofocus;
  final String? Function(String?)? validator;

  @override
  State<StatefulWidget> createState() {
    return _BlottInputPrimaryState();
  }
}

class _BlottInputPrimaryState extends State<BlottInputPrimary> {
  @override
  void initState() {
    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      // enableInteractiveSelection: false,
      autofocus: widget.autofocus,
      name: widget.fieldName,
      controller: widget.textInputTextEditController,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: underLineInputBorder(BlottColors.textInputBorderColor),
        focusedBorder: underLineInputBorder(BlottColors.textInputBorderColor),
        errorBorder:
            underLineInputBorder(BlottColors.textInputErrorBorderColor),
        focusedErrorBorder:
            underLineInputBorder(BlottColors.textInputErrorBorderColor),
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.0.h,
          horizontal: 0.0,
        ),
        errorStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 13.0.sp,
          color: BlottColors.textInputErrorBorderColor,
        ),
        helperText: '',
        helperStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 13.0.sp,
        ),
        hintStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 20.0.sp,
          color: BlottColors.textInputHintColor,
        ),
        hintText: widget.inputHint,
      ),
      textAlignVertical: TextAlignVertical.center,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 16.0.sp,
      ),
      onChanged: widget.onChanged,
    );
  }

  UnderlineInputBorder underLineInputBorder(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: color,
      ),
    );
  }
}
