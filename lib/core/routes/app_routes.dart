import '../../common/widgets/route_undefined_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/home/presentation/news_detail_screen.dart';
import '../../features/onboarding/presentation/notification_permission_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRouter goRouter = GoRouter(
    initialLocation: HomeScreen.routePath,
    // initialLocation: SplashScreen.routePath,
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
      GoRoute(
        name: OnboardingScreen.routeName,
        path: OnboardingScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        name: NotificationPermissionScreen.routeName,
        path: NotificationPermissionScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationPermissionScreen();
        },
      ),
      GoRoute(
        name: HomeScreen.routeName,
        path: HomeScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: NewsDetailScreen.routeName,
        path: NewsDetailScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          final displaySiteUrl = state.extra as String;

          return NewsDetailScreen(
            displaySiteUrl: displaySiteUrl,
          );
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
