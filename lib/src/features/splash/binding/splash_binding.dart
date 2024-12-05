part of '../splash.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(
        locator<FetchTokenDeviceUseCase>(),
        locator<FetchInfoLoginUsecase>(),
        locator<GetTokenDeviceUseCase>(),
        locator<GetFirstLoginUseCase>()));
  }
}
