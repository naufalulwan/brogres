import 'package:get_it/get_it.dart';

import '../core/auth/auth_core.dart';
import '../core/splash/splash_core.dart';
import '../global/global.dart';
import 'dio_client_config.dart';

final locator = GetIt.instance;

class LocatorConfig {
  static const bool _isInited = false;

  bool get isInited => _isInited;
  bool get isNotInited => !_isInited;

  static Future<void> init() async {
    if (_isInited) return;
    locator.registerLazySingleton<DioClient>(
        () => DioClient.create(DioClientConfig()));
    locator.registerLazySingleton<RouteObserverUtil>(() => RouteObserverUtil());
    await splashDI();
    await authDI();
  }
}
