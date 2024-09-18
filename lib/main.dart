import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(const AppBlott());
}

class AppBlott extends StatelessWidget {
  const AppBlott({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        title: 'Blott',
        debugShowCheckedModeBanner: false,
        routeInformationProvider: AppRoutes.goRouter.routeInformationProvider,
        routeInformationParser: AppRoutes.goRouter.routeInformationParser,
        routerDelegate: AppRoutes.goRouter.routerDelegate,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
      ),
    );
  }
}
