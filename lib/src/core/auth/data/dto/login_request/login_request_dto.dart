import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginRequestDTO {
  final String username;
  final String password;
  final String deviceId;
  final String deviceToken;
  final bool? isSaveInfo;
  final String ssn;

  LoginRequestDTO({
    required this.username,
    required this.password,
    required this.deviceId,
    required this.deviceToken,
    this.isSaveInfo,
    required this.ssn,
  });

  factory LoginRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDTOToJson(this);
}
