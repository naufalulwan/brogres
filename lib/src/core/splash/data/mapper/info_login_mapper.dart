part of '../data.dart';

extension InfoLoginDTOMapper on InfoLoginDTO {
  InfoLoginEntity toEntity() {
    return InfoLoginEntity(
        id: id!,
        username: user!.username!,
        deviceId: user!.deviceId!,
        isSaveInfo: user!.isSaveInfo!);
  }
}

extension InfoLoginEntityMapper on InfoLoginEntity {
  InfoLoginDTO toDto() {
    return InfoLoginDTO();
  }
}
