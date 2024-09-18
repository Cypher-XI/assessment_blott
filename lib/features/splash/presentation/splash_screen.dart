import 'dart:async';

import 'package:go_router/go_router.dart';

import '../../../common/constants/color_const.dart';
import '../../../common/constants/image_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../onboarding/presentation/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routePath = '/splashScreen';
  static const String routeName = 'splash-screen';

  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacementNamed(OnboardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlottColors.splashBackgroundColor,
      body: Center(
        child: SvgPicture.asset(
          BlottImages.blottLogo,
        ),
      ),
    );
  }
}
