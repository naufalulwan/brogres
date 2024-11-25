part of '../data.dart';

abstract class AuthDataSource {
  final Dio _dio;

  AuthDataSource({required Dio dio}) : _dio = dio;

  Future<ApiResponse<LoginDTO>> login(LoginRequestDTO request);
}
