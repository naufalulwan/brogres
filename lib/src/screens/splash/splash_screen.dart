import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/asset_string.dart';
import '../../core/constants/route_string.dart';
import '../../core/utils/color_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) context.pushReplacement(RouteString.onboardingScreen);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorUtil().secondaryVanilla,
      body: Center(
          child: SizedBox(
        width: 230,
        height: 300,
        child: Stack(children: [
          Opacity(
              opacity: 0.2,
              child: Image.asset(AssetString.useSplash, color: Colors.black)),
          ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 4),
                  child: Image.asset(AssetString.useSplash)))
        ]),
      )),
    );
  }
}
