part of '../data.dart';

extension LoginRequestEntityMapper on LoginRequestEntity {
  LoginRequestDTO toDTO() {
    return LoginRequestDTO(
        username: username,
        password: password,
        deviceId: deviceId,
        deviceToken: deviceToken,
        ssn: ssn,
        isSaveInfo: isSaveLogin);
  }
}
