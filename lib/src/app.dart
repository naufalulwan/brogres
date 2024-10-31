import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routes/config_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: ConfigRoute.go.routeInformationProvider,
      routeInformationParser: ConfigRoute.go.routeInformationParser,
      routerDelegate: ConfigRoute.go.routerDelegate,
    );
  }
}
