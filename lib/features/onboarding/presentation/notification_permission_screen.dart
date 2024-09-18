import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/constants/color_const.dart';
import '../../../common/constants/dimens.dart';
import '../../../common/constants/icon_const.dart';
import '../../../common/constants/string_const.dart';
import '../../../common/widgets/buttons/filled_button.dart';
import '../../../common/widgets/text_labels/label_custom.dart';
import '../../../common/widgets/text_labels/label_subtitle.dart';
import '../../home/presentation/home_screen.dart';

class NotificationPermissionScreen extends StatefulWidget {
  static const String routePath = '/notificationPermissionScreen';
  static const String routeName = 'notification-permission-screen';

  const NotificationPermissionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotificationPermissionScreenState();
  }
}

class _NotificationPermissionScreenState
    extends State<NotificationPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlottColors.lightScreenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: BlottDimens.defaultPaddingHorizontal,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset(
                  BlottIcons.notification,
                  width: 98.w,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 24.h,
                ),
                const BlottLabelCustom(
                  title: BlottStrings.permissionScreenTitle,
                  size: 24.0,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const BlottLabelSubtitle(
                  title: BlottStrings.permissionScreenSubTitle,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: BlottButtonFilled(
                    onPressedB: () async {
                      final notificationStatus =
                          await Permission.notification.status;

                      switch (notificationStatus) {
                        ///
                        case PermissionStatus.granted:
                          GoRouter.of(context)
                              .pushReplacementNamed(HomeScreen.routeName);

                        ///
                        case PermissionStatus.denied:
                          Permission.notification.request();

                        ///
                        case PermissionStatus.permanentlyDenied:
                        default:
                          final snackBar = SnackBar(
                            content: const Text(
                              BlottStrings.snackBarMessageEnablePermission,
                            ),
                            backgroundColor: BlottColors.snackBarColor,
                            action: SnackBarAction(
                              label: 'SETTINGS',
                              onPressed: () async {
                                await openAppSettings();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    title: BlottStrings.continueButtonTitle,
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
