import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';
import '../global/global.dart';

class RouteConfig {
  static GoRouter go = GoRouter(
    observers: [RouteObserverUtil()],
    initialLocation: RouteString.splashScreen,
    routes: [
      GoRoute(
        path: RouteString.splashScreen,
        builder: (context, state) => CustomBuilderUtil<SplashController>(
          binding: SplashBinding(),
          on: (context, controller) {
            controller.initSplash(context);
          },
          builder: (DisposableInterface controller) => const SplashScreen(),
        ),
      ),
      GoRoute(
        path: RouteString.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: RouteString.loginScreen,
        path: RouteString.loginScreen,
        builder: (context, state) => CustomBuilderUtil<AuthController>(
            binding: AuthBinding(), builder: (_) => const LoginScreen()),
      ),
      GoRoute(
        name: RouteString.maintenanceScreen,
        path: RouteString.maintenanceScreen,
        builder: (context, state) => const MaintenanceScreen(),
      ),
      GoRoute(
        name: RouteString.dashboardScreen,
        path: RouteString.dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        name: RouteString.productScreen,
        path: RouteString.productScreen,
        builder: (context, state) {
          return ProductScreen(
            category: state.extra as String?,
          );
        },
      ),
    ],
    errorBuilder: (context, state) {
      return const UnknownScreen();
    },
  );
}
