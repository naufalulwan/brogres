part of '../domain.dart';

class SplashRepositoryImpl extends SplashRepository {
  late final SplashDataSource _splashDataSource;

  SplashRepositoryImpl({
    required SplashDataSource splashDataSource,
  }) : _splashDataSource = splashDataSource;

  @override
  Future<Either<ErrorHandleUtil, SplashTokenEntity>> fetchTokenSplash() async {
    try {
      var response = await _splashDataSource.fetchTokenSplash();

      if (response.isSuccess) {
        return Right(response.data!.toEntity());
      } else {
        return Left(response.error!);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
