part of '../global.dart';

class ApiResponse<T> {
  final T? data;
  final ErrorHandleUtil? error;

  ApiResponse({this.data, this.error});

  bool get isSuccess => data != null;
}
