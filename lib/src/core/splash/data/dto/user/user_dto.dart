import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserDTO {
  final String? username;
  final String? deviceId;
  final bool? isSaveInfo;

  UserDTO({
    this.username,
    this.deviceId,
    this.isSaveInfo,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
