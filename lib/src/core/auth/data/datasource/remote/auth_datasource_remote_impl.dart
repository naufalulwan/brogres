part of '../../data.dart';

class AuthDataSourceRemoteImpl extends AuthDataSourceRemote {
  AuthDataSourceRemoteImpl({required super.dio});

  @override
  Future<ResponseModelHelper<LoginDTO>> login(LoginRequestDTO request) async {
    try {
      final response = await _dio.post(UrlString.login, data: request.toJson());

      return ResponseModelHelper(data: LoginDTO.fromJson(response.data));
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
