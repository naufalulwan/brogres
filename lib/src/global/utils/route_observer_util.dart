import 'package:flutter/material.dart';

import '../global.dart';

class RouteObserverUtil extends NavigatorObserver {
  String? _currentRouteName;
  String? get currentRouteName => _currentRouteName;

  @override
  void didPush(Route route, Route? previousRoute) {
    _currentRouteName = route.settings.name;
    if (route.settings.name != null) {
      PrintHelper.logSystem("Route pushed: ${route.settings.name}",
          type: PrintType.route);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _currentRouteName = previousRoute?.settings.name;
    if (route.settings.name != null) {
      PrintHelper.logSystem("Route popped: ${route.settings.name}",
          type: PrintType.route);
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _currentRouteName = newRoute?.settings.name;
    PrintHelper.logSystem("Route replaced: ${newRoute?.settings.name}",
        type: PrintType.route);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _currentRouteName = previousRoute?.settings.name;
    PrintHelper.logSystem("Route removed: ${route.settings.name}",
        type: PrintType.route);
    super.didRemove(route, previousRoute);
  }
}
