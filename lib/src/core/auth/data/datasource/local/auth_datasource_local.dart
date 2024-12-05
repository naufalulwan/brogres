part of '../../data.dart';

abstract class AuthDataSourceLocal {
  Future<void> saveFirstTimeLogin(bool value);
  Future<void> saveInfoLogin(
      {required String username,
      required String deviceId,
      required bool isSaveInfo});
  Future<String> getTokenDevice();
}
