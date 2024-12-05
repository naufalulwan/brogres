part of '../../data.dart';

abstract class AuthDataSourceRemote {
  final Dio _dio;
  AuthDataSourceRemote({required Dio dio}) : _dio = dio;

  Future<ResponseModelHelper<LoginDTO>> login(LoginRequestDTO request);
}
