part of '../domain.dart';

class SplashRepositoryImpl extends SplashRepository {
  late final SplashDataSourceRemote _splashDataSourceRemote;
  late final SplashDataSourceLocal _splashDataSourceLocal;

  SplashRepositoryImpl({
    required SplashDataSourceRemote splashDataSourceRemote,
    required SplashDataSourceLocal splashDataSourceLocal,
  })  : _splashDataSourceRemote = splashDataSourceRemote,
        _splashDataSourceLocal = splashDataSourceLocal;

  @override
  Future<dz.Either<ErrorModelHelper, TokenDeviceEntity>>
      fetchTokenSplash() async {
    try {
      var response = await _splashDataSourceRemote.fetchTokenSplash();
      if (response.isSuccess) {
        TokenDeviceEntity data = response.data!.toEntity();
        _splashDataSourceLocal.saveTokenDevice(tokenDevice: data.token);
        return dz.Right(data);
      } else {
        ErrorModelHelper data = response.error!;
        return dz.Left(data);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> getTokenSplash() async {
    String tokenDevice = await _splashDataSourceLocal.getTokenDevice();
    if (tokenDevice.isNotEmpty) {
      return tokenDevice;
    } else {
      return "";
    }
  }

  @override
  Future<bool> getFirstTimeSplash() async {
    bool isFirstTimeLogin = await _splashDataSourceLocal.getFirstTimeLogin();
    if (isFirstTimeLogin) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<dz.Either<ErrorModelHelper, InfoLoginEntity>> fetchLoginInfo() async {
    try {
      var infoLogin = await _splashDataSourceLocal.getInfoLogin();

      if (infoLogin == null && infoLogin!["isSaveInfo"] != true) {
        return dz.Left(ErrorModelHelper.ignoreError());
      }

      var response = await _splashDataSourceRemote.fetchInfoLogin(
          username: infoLogin["username"] as String,
          deviceId: infoLogin["deviceId"] as String);

      if (response.isSuccess) {
        return dz.Right(response.data!.toEntity());
      } else {
        return dz.Left(response.error!);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
