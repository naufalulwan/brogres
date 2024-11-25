import '../../../configs/locator_config.dart';
import '../../../global/global.dart';
import '../data/data.dart';
import '../domain/domain.dart';

Future<void> splashDI() async {
  locator.registerLazySingleton<SplashDataSource>(
      () => SplashDataSourceImpl(dio: locator<DioClientUtil>().dioClient.dio));

  locator.registerLazySingleton<SplashRepository>(() =>
      SplashRepositoryImpl(splashDataSource: locator<SplashDataSource>()));

  locator.registerLazySingleton<FetchTokenSplashUseCase>(() =>
      FetchTokenSplashUseCase(splashRepository: locator<SplashRepository>()));
}
