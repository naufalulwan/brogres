part of '../../auth.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(locator<LoginUseCase>()));
  }
}
