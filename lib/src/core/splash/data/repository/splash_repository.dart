part of '../data.dart';

abstract class SplashRepository {
  Future<Either<ErrorHandleUtil, SplashTokenEntity>> fetchTokenSplash();
}
