import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'route_config.dart';
import '../global/global.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    precachedImages(context);
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: RouteConfig.go.routeInformationProvider,
      routeInformationParser: RouteConfig.go.routeInformationParser,
      routerDelegate: RouteConfig.go.routerDelegate,
    );
  }

  Future<void> precachedImages(BuildContext context) async {
    precacheImage(const AssetImage(AssetString.useOnboarding1), context);
    precacheImage(const AssetImage(AssetString.useOnboarding2), context);
    precacheImage(const AssetImage(AssetString.useOnboarding3), context);
    precacheImage(const AssetImage(AssetString.useIntersect1), context);
    precacheImage(const AssetImage(AssetString.useIntersect2), context);
    precacheImage(const AssetImage(AssetString.useIntersect3), context);
    precacheImage(const AssetImage(AssetString.useMaintenance), context);
    precacheImage(const AssetImage(AssetString.useEmpty), context);
    precacheImage(const AssetImage(AssetString.useSplash), context);
    precacheImage(const AssetImage(AssetString.useLoginDeco), context);
  }
}
