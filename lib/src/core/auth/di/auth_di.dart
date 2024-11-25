import '../../../configs/locator_config.dart';
import '../../../global/global.dart';
import '../auth_core.dart';

Future<void> authDI() async {
  locator.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(dio: locator<DioClientUtil>().dioClient.dio));

  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: locator<AuthDataSource>()));

  locator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: locator<AuthRepository>()));
}
