part of '../data.dart';

class AuthDataSourceImpl extends AuthDataSource {
  AuthDataSourceImpl({required super.dio});

  @override
  Future<ApiResponse<LoginDTO>> login(LoginRequestDTO request) async {
    try {
      final response = await _dio.post(UrlString.login, data: request.toJson());

      return ApiResponse(data: LoginDTO.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400 || e.response!.statusCode == 401) {
          return ApiResponse(error: ErrorHandleUtil.fromJson(e.response!.data));
        } else {
          throw Exception(e.message);
        }
      } else {
        throw Exception('Failed to connect to the server');
      }
    }
  }
}
