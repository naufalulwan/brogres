part of '../domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final AuthDataSourceRemote _authDataSourceRemote;
  late final AuthDataSourceLocal _authDataSourceLocal;

  AuthRepositoryImpl(
      {required AuthDataSourceRemote authDataSourceRemote,
      required AuthDataSourceLocal authDataSourceLocal})
      : _authDataSourceRemote = authDataSourceRemote,
        _authDataSourceLocal = authDataSourceLocal;

  @override
  Future<dz.Either<ErrorModelHelper, LoginEntity>> login(
      LoginRequestEntity params) async {
    try {
      String tokenDevice = await _authDataSourceLocal.getTokenDevice();
      LoginRequestEntity dataParse = params.copyWith(deviceToken: tokenDevice);

      var response = await _authDataSourceRemote.login(dataParse.toDTO());

      if (response.isSuccess) {
        _authDataSourceLocal.saveFirstTimeLogin(true);

        if (params.isSaveLogin!) {
          _authDataSourceLocal.saveInfoLogin(
            username: params.username,
            deviceId: params.deviceId,
            isSaveInfo: params.isSaveLogin!,
          );
        }

        return dz.Right(response.data!.toEntity());
      } else {
        return dz.Left(response.error!);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
