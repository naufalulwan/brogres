part of '../../data.dart';

abstract class SplashDataSourceLocal {
  Future<void> saveTokenDevice({String? tokenDevice});
  Future<String> getTokenDevice();
  Future<bool> getFirstTimeLogin();
  Future<Map<String, dynamic>?> getInfoLogin();
}
