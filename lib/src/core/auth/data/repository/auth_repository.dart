part of '../data.dart';

abstract class AuthRepository {
  Future<dz.Either<ErrorHandleUtil, LoginEntity>> login(
      LoginRequestEntity param);
}
