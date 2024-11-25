import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'splash_token_dto.g.dart';

@HiveType(typeId: 2, adapterName: "TokenAdapter")
@JsonSerializable()
class SplashTokenDTO {
  final bool? error;
  final int? code;
  final String? message;
  @HiveField(0)
  final String? token;

  const SplashTokenDTO({
    this.error,
    this.code,
    this.message,
    this.token,
  });

  factory SplashTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$SplashTokenDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SplashTokenDTOToJson(this);
}
