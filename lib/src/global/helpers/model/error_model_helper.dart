import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model_helper.g.dart';

@JsonSerializable()
class ErrorModelHelper {
  final bool error;
  final int code;
  final String message;

  ErrorModelHelper(
      {required this.error, required this.code, required this.message});

  factory ErrorModelHelper.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelHelperFromJson(json);

  factory ErrorModelHelper.ignoreError() {
    return ErrorModelHelper(
      error: false,
      code: 0,
      message: "default error ignored",
    );
  }

  Map<String, dynamic> toJson() => _$ErrorModelHelperToJson(this);
}
