import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/color_const.dart';
import '../../../common/constants/dimens.dart';
import '../../../common/constants/icon_const.dart';
import '../../../common/constants/string_const.dart';
import '../../../common/widgets/text_inputs/primary_input.dart';
import '../../../common/widgets/text_labels/label_subtitle.dart';
import '../../../common/widgets/text_labels/label_title.dart';
import '../../../core/storage/secured_storage.dart';
import 'notification_permission_screen.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  static const String routePath = '/onboardingScreen';
  static const String routeName = 'onboarding-screen';

  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final nameFormKey = GlobalKey<FormBuilderState>();
  bool validForm = false;

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
              FormBuilder(
                key: nameFormKey,
                onChanged: () {
                  setState(() {
                    nameFormKey.currentState!.saveAndValidate();
                    validForm = nameFormKey.currentState!.isValid;
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    BlottInputPrimary(
                      fieldName: 'firstName',
                      textInputTextEditController: firstNameController,
                      inputHint: BlottStrings.firstNameHint,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          if (nameFormKey.currentState!.validate()) {
            ///
            await Future.wait([
              ref.read(securedStorageProvider).clearAllData(),
              ref
                  .read(securedStorageProvider)
                  .storeFirstName(firstNameController.text),
              ref
                  .read(securedStorageProvider)
                  .storeLastName(lastNameController.text),
            ]);

            GoRouter.of(context)
                .pushReplacementNamed(NotificationPermissionScreen.routeName);
          }
        },
        shape: const CircleBorder(),
        backgroundColor: validForm
            ? BlottColors.enabledButtonColor
            : BlottColors.disabledButtonColor,
        elevation: 0.0,
        child: SvgPicture.asset(
          BlottIcons.chevronRight,
        ),
      ),
    );
  }
}
