part of '../../data.dart';

class SplashDataSourceRemoteImpl extends SplashDataSourceRemote {
  SplashDataSourceRemoteImpl({required super.dio});

  @override
  Future<ResponseModelHelper<TokenDeviceDTO>> fetchTokenSplash() async {
    try {
      final response = await _dio.get(UrlString.getTokenDevice);
      return ResponseModelHelper(data: TokenDeviceDTO.fromJson(response.data));
    } on DioException catch (_) {
      throw ExceptionHelper(HardCodeString.errorRemote);
    }
  }

  @override
  Future<ResponseModelHelper<InfoLoginDTO>> fetchInfoLogin(
      {required String username, required String deviceId}) async {
    try {
      final response = await _dio.put(UrlString.getInfoLogin, data: {
        'username': username,
        'device_id': deviceId,
      });

      return ResponseModelHelper(data: InfoLoginDTO.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModelHelper(
            error: ErrorModelHelper.fromJson(e.response!.data));
      } else {
        throw ExceptionHelper(HardCodeString.errorRemote);
      }
    }
  }
}
