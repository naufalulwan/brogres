part of '../data.dart';

class SplashDataSourceImpl extends SplashDataSource {
  SplashDataSourceImpl({required super.dio});

  @override
  Future<ApiResponse<SplashTokenDTO>> fetchTokenSplash() async {
    try {
      final response = await _dio.get(UrlString.getTokenDevice);
      if (response.statusCode == 200) {
        return ApiResponse(data: SplashTokenDTO.fromJson(response.data));
      } else {
        return ApiResponse(
            error: ErrorHandleUtil(
                error: true,
                code: 401,
                message:
                    "gagal mendapatkan token device splash, silahkan coba lagi nanti"));
      }
    } on DioException catch (_) {
      return ApiResponse(
          error: ErrorHandleUtil(
              error: true,
              code: 401,
              message: "tidak dapat terhubung ke server, silahkan coba lagi"));
    }
  }
}
