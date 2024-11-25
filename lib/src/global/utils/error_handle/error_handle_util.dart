import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_handle_util.g.dart';

@JsonSerializable()
class ErrorHandleUtil {
  final bool error;
  final int code;
  final String message;

  ErrorHandleUtil(
      {required this.error, required this.code, required this.message});

  factory ErrorHandleUtil.fromJson(Map<String, dynamic> json) =>
      _$ErrorHandleUtilFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorHandleUtilToJson(this);
}
