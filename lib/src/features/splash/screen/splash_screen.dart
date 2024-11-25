part of '../splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorUtil().secondaryVanilla,
      body: Center(
          child: SizedBox(
        width: 230,
        height: 500,
        child: Stack(alignment: Alignment.center, children: [
          Opacity(
              opacity: 0.2,
              child: Image.asset(AssetString.useSplash, color: Colors.black)),
          ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 4),
                  child: Image.asset(AssetString.useSplash))),
          Obx(() {
            if (controller.isLoading.value) {
              return Positioned(
                top: 350,
                child: Lottie.asset('assets/lotties/loading-brown-lottie.json',
                    repeat: true, height: 100),
              );
            } else {
              return const SizedBox.shrink();
            }
          })
        ]),
      )),
    );
  }
}
