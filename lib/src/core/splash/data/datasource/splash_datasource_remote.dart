part of '../data.dart';

abstract class SplashDataSource {
  final Dio _dio;

  SplashDataSource({required Dio dio}) : _dio = dio;

  Future<ApiResponse<SplashTokenDTO>> fetchTokenSplash();
}
