import 'package:get_it/get_it.dart';

import '../core/auth/auth_core.dart';
import '../core/splash/splash_core.dart';
import '../global/global.dart';

final locator = GetIt.instance;

class LocatorConfig {
  Future<void> init() async {
    locator.registerLazySingleton<DioClientUtil>(() => DioClientUtil.create(
          DioClient(),
        ));
    splashDI();
    authDI();
  }
}
