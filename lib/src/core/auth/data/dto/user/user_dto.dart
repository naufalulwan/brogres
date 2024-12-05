import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  final String? username;
  final String? email;
  final String? level;
  final bool? status;

  UserDTO({
    this.username,
    this.email,
    this.level,
    this.status,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
