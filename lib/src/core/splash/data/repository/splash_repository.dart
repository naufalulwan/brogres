part of '../data.dart';

abstract class SplashRepository {
  Future<dz.Either<ErrorModelHelper, TokenDeviceEntity>> fetchTokenSplash();
  Future<String> getTokenSplash();
  Future<bool> getFirstTimeSplash();
  Future<dz.Either<ErrorModelHelper, InfoLoginEntity>> fetchLoginInfo();
}
