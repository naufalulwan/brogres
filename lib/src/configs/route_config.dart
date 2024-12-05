import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';
import '../global/global.dart';
import '../global/helpers/router/builder_helper.dart';
import '../global/helpers/router/shell_route_helper.dart';
import 'locator_config.dart';

class RouteConfig {
  static GoRouter go = GoRouter(
    observers: [locator<RouteObserverUtil>()],
    initialLocation: RouteString.splashScreen,
    routes: [
      GoRoute(
        path: RouteString.splashScreen,
        builder: (context, state) => BuilderHelper<SplashController>(
          binding: SplashBinding(),
          autoRemove: true,
          on: (context, controller) {
            controller.initSplash(context);
          },
          builder: (_) => const SplashScreen(),
        ),
      ),
      GoRoute(
        path: RouteString.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRouteHelper<HomeController>(
          binding: HomeBinding(),
          autoRemove: true,
          shellBuilder: (context, state, child) {
            return BaseUi(child: child);
          },
          routes: [
            GoRoute(
              name: RouteString.dashboardScreen,
              path: RouteString.dashboardScreen,
              pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey, child: const DashboardScreen()),
            ),
            GoRoute(
              name: RouteString.productScreen,
              path: RouteString.productScreen,
              pageBuilder: (context, state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: ProductScreen(
                    category: state.extra as String?,
                  ),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
          ]),
      GoRoute(
        name: RouteString.loginScreen,
        path: RouteString.loginScreen,
        builder: (context, state) => BuilderHelper<AuthController>(
            autoRemove: true,
            binding: AuthBinding(),
            builder: (_) => const LoginScreen()),
      ),
      GoRoute(
        name: RouteString.maintenanceScreen,
        path: RouteString.maintenanceScreen,
        builder: (context, state) => const MaintenanceScreen(),
      ),
    ],
    errorBuilder: (context, state) {
      return const UnknownScreen();
    },
  );
}
