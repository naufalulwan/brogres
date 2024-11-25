import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'configs/route_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: RouteConfig.go.routeInformationProvider,
      routeInformationParser: RouteConfig.go.routeInformationParser,
      routerDelegate: RouteConfig.go.routerDelegate,
    );
  }
}
