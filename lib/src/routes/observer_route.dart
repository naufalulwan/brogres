import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ObserverRoute extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log("Route pushed: ${route.settings.name}");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log("Route popped: ${route.settings.name}");
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    log("Route replaced: ${newRoute?.settings.name}");
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    log("Route removed: ${route.settings.name}");
  }
}
