part of '../data.dart';

extension TokenDeviceDTOMapper on TokenDeviceDTO {
  TokenDeviceEntity toEntity() {
    return TokenDeviceEntity(
        id: const Uuid().v4(),
        error: error!,
        code: code!,
        message: message!,
        token: token!);
  }
}

extension TokenDeviceEntityMapper on TokenDeviceEntity {
  TokenDeviceDTO toDTO() {
    return TokenDeviceDTO(
      error: error,
      code: code,
      message: message,
      token: token,
    );
  }
}
