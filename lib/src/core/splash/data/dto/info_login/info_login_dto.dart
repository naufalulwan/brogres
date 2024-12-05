import 'package:json_annotation/json_annotation.dart';

import '../user/user_dto.dart';

part 'info_login_dto.g.dart';

@JsonSerializable()
class InfoLoginDTO {
  final int? id;
  final bool? error;
  final int? code;
  final String? message;
  final UserDTO? user;

  InfoLoginDTO({
    this.id,
    this.error,
    this.code,
    this.message,
    this.user,
  });

  factory InfoLoginDTO.fromJson(Map<String, dynamic> json) =>
      _$InfoLoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$InfoLoginDTOToJson(this);
}
