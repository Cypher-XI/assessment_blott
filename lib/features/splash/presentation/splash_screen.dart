import 'package:assessment_blott/common/constants/color_const.dart';
import 'package:assessment_blott/common/constants/image_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../authentication/presentation/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
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

    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
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
