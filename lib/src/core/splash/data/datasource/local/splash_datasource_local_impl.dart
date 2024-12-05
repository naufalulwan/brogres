part of '../../data.dart';

class SplashDataSourceLocalImpl implements SplashDataSourceLocal {
  @override
  Future<String> getTokenDevice() async {
    return StoredHelper.getData(key: StoredString.field$tokenDevice);
  }

  @override
  Future<void> saveTokenDevice({String? tokenDevice}) async {
    StoredHelper.saveData(
        key: StoredString.field$tokenDevice, value: tokenDevice);
  }

  @override
  Future<bool> getFirstTimeLogin() async {
    return StoredHelper.getData(key: StoredString.field$firstTimeLogin);
  }

  @override
  Future<Map<String, dynamic>?> getInfoLogin() async {
    Map<dynamic, dynamic> data =
        await StoredHelper.getData(key: StoredString.field$infoLogin);
    Map<String, dynamic> dataConvert =
        data.map((key, value) => MapEntry<String, dynamic>(key, value));
    return dataConvert;
  }
}
