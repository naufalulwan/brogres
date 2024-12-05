import 'package:json_annotation/json_annotation.dart';

part 'token_device_dto.g.dart';

@JsonSerializable()
class TokenDeviceDTO {
  final bool? error;
  final int? code;
  final String? message;
  final String? token;

  const TokenDeviceDTO({
    this.error,
    this.code,
    this.message,
    this.token,
  });

  factory TokenDeviceDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenDeviceDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDeviceDTOToJson(this);
}
