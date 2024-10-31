import 'package:brogres/src/core/constants/route_string.dart';
import 'package:brogres/src/screens/auth_screen/login_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/maintenance_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/unknown_screen.dart';
import 'observer_route.dart';

class ConfigRoute {
  static GoRouter go = GoRouter(
    observers: [ObserverRoute()],
    initialLocation: RouteString.splashScreen,
    routes: [
      GoRoute(
        path: RouteString.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteString.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteString.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteString.maintenanceScreen,
        builder: (context, state) => const MaintenanceScreen(),
      ),
    ],
    errorBuilder: (context, state) {
      return const UnknownScreen();
    },
  );
}
