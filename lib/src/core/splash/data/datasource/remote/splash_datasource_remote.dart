part of '../../data.dart';

abstract class SplashDataSourceRemote {
  final Dio _dio;
  SplashDataSourceRemote({required Dio dio}) : _dio = dio;

  Future<ResponseModelHelper<TokenDeviceDTO>> fetchTokenSplash();
  Future<ResponseModelHelper<InfoLoginDTO>> fetchInfoLogin(
      {required String username, required String deviceId});
}
