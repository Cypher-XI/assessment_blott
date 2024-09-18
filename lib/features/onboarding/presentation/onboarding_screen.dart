import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../common/constants/color_const.dart';
import '../../../common/constants/dimens.dart';
import '../../../common/constants/icon_const.dart';
import '../../../common/constants/string_const.dart';
import '../../../common/widgets/text_inputs/primary_input.dart';
import '../../../common/widgets/text_labels/label_subtitle.dart';
import '../../../common/widgets/text_labels/label_title.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routePath = '/onboardingScreen';
  static const String routeName = 'onboarding-screen';

  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final nameFormKey = GlobalKey<FormState>();

  ///
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlottColors.lightScreenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: BlottDimens.defaultPaddingHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BlottLabelTitle(
                title: BlottStrings.signinScreenTitle,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              const BlottLabelSubtitle(
                title: BlottStrings.signinScreenSubTitle,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Form(
                key: nameFormKey,
                child: Column(
                  children: [
                    BlottInputPrimary(
                      fieldName: 'firstName',
                      textInputTextEditController: firstNameController,
                      inputHint: BlottStrings.firstNameHint,
                      keyboardType: TextInputType.name,
                      // textInputAction: TextInputAction.next,
                      autofocus: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: BlottStrings.firstNameRequired,
                        ),
                        FormBuilderValidators.minLength(
                          3,
                          errorText: BlottStrings.firstNameMinLength,
                        ),
                        FormBuilderValidators.maxLength(
                          12,
                          errorText: BlottStrings.firstNameMaxLength,
                        ),
                      ]),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    BlottInputPrimary(
                      fieldName: 'lastName',
                      textInputTextEditController: lastNameController,
                      inputHint: BlottStrings.lastNameHint,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: BlottStrings.lastNameRequired,
                        ),
                        FormBuilderValidators.minLength(
                          3,
                          errorText: BlottStrings.lastNameMinLength,
                        ),
                        FormBuilderValidators.maxLength(
                          12,
                          errorText: BlottStrings.lastNameMaxLength,
                        ),
                      ]),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (nameFormKey.currentState!.validate()) {}
        },
        shape: const CircleBorder(),
        backgroundColor: (nameFormKey.currentState?.validate() ?? false)
            ? BlottColors.enabledNextButtonColor
            : BlottColors.disabledNextButtonColor,
        elevation: 0.0,
        child: SvgPicture.asset(
          BlottIcons.chevronRight,
        ),
      ),
    );
  }
}
