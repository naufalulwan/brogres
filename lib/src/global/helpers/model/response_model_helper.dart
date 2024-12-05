import 'error_model_helper.dart';

class ResponseModelHelper<T> {
  final T? data;
  final ErrorModelHelper? error;

  ResponseModelHelper({this.data, this.error});

  bool get isSuccess => data != null;
}
