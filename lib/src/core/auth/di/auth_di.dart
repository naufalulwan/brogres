import '../../../configs/dio_client_config.dart';
import '../../../configs/locator_config.dart';
import '../auth_core.dart';

Future<void> authDI() async {
  locator.registerLazySingleton<AuthDataSourceRemote>(
      () => AuthDataSourceRemoteImpl(dio: locator<DioClient>().dioClient.dio));

  locator.registerLazySingleton<AuthDataSourceLocal>(
      () => AuthDataSourceLocalImpl());

  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authDataSourceRemote: locator<AuthDataSourceRemote>(),
      authDataSourceLocal: locator<AuthDataSourceLocal>()));

  locator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: locator<AuthRepository>()));
}
