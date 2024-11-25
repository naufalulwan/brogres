part of '../domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final AuthDataSource _authDataSource;

  AuthRepositoryImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;

  @override
  Future<Either<ErrorHandleUtil, LoginEntity>> login(
      LoginRequestEntity params) async {
    try {
      var response = await _authDataSource.login(params.toDTO());

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
