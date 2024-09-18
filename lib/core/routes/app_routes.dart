import '../../common/widgets/route_undefined_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRouter goRouter = GoRouter(
    initialLocation: SplashScreen.routePath,
    debugLogDiagnostics: true,

    ///
    routes: <GoRoute>[
      GoRoute(
        name: SplashScreen.routeName,
        path: SplashScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
    ],

    ///
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: RouteUndefinedScreen(
        errorMessage: state.error.toString(),
      ),
    ),
  );
}
