part of '../global.dart';

class RouteObserverUtil extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      PrintUtil.logInfo("Route pushed: ${route.settings.name}");
    } else {
      PrintUtil.logInfo("Route pushed: membuka");
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name != null) {
      PrintUtil.logInfo("Route popped: ${route.settings.name}");
    } else {
      PrintUtil.logInfo("Route popped: menutup");
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    PrintUtil.logInfo("Route replaced: ${newRoute?.settings.name}");
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    PrintUtil.logInfo("Route removed: ${route.settings.name}");
  }
}
