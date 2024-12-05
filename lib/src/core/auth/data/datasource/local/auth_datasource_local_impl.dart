part of '../../data.dart';

class AuthDataSourceLocalImpl implements AuthDataSourceLocal {
  @override
  Future<String> getTokenDevice() async {
    return StoredHelper.getData<String>(key: StoredString.field$tokenDevice);
  }

  @override
  Future<void> saveFirstTimeLogin(bool value) async {
    StoredHelper.saveData(key: StoredString.field$firstTimeLogin, value: value);
  }

  @override
  Future<void> saveInfoLogin(
      {required String username,
      required String deviceId,
      required bool isSaveInfo}) async {
    StoredHelper.saveData(key: StoredString.field$infoLogin, value: {
      'isSaveInfo': isSaveInfo,
      'username': username,
      'deviceId': deviceId
    });
  }
}
