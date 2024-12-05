import 'package:json_annotation/json_annotation.dart';

part 'authorization_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthorizationDTO {
  final String? token;
  final String? refreshToken;
  final String? type;

  AuthorizationDTO({
    this.token,
    this.refreshToken,
    this.type,
  });

  factory AuthorizationDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationDTOToJson(this);
}
