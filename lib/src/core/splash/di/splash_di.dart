import '../../../configs/dio_client_config.dart';
import '../../../configs/locator_config.dart';

import '../data/data.dart';
import '../domain/domain.dart';

Future<void> splashDI() async {
  locator.registerLazySingleton<SplashDataSourceRemote>(() =>
      SplashDataSourceRemoteImpl(dio: locator<DioClient>().dioClient.dio));

  locator.registerLazySingleton<SplashDataSourceLocal>(
      () => SplashDataSourceLocalImpl());

  locator.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(
      splashDataSourceRemote: locator<SplashDataSourceRemote>(),
      splashDataSourceLocal: locator<SplashDataSourceLocal>()));

  locator.registerLazySingleton<FetchTokenDeviceUseCase>(() =>
      FetchTokenDeviceUseCase(splashRepository: locator<SplashRepository>()));

  locator.registerLazySingleton<FetchInfoLoginUsecase>(() =>
      FetchInfoLoginUsecase(splashRepository: locator<SplashRepository>()));

  locator.registerLazySingleton<GetTokenDeviceUseCase>(() =>
      GetTokenDeviceUseCase(splashRepository: locator<SplashRepository>()));

  locator.registerLazySingleton<GetFirstLoginUseCase>(() =>
      GetFirstLoginUseCase(splashRepository: locator<SplashRepository>()));
}
