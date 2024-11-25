import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../authorization/authorization_dto.dart';
import '../user/user_dto.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDTO {
  final int? id;
  final bool? error;
  final int? code;
  final String? message;
  final UserDTO? userDTO;
  final AuthorizationDTO? authorizationDTO;

  LoginDTO({
    this.id,
    this.error,
    this.code,
    this.message,
    this.userDTO,
    this.authorizationDTO,
  });

  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}
