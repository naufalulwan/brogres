part of '../data.dart';

abstract class AuthRepository {
  Future<dz.Either<ErrorModelHelper, LoginEntity>> login(
      LoginRequestEntity param);
}
