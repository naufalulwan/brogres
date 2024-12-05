import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UseCaseObserverUtil<T, E> implements Observer<T> {
  void Function(T?, E?, Exception?)? response;
  void Function()? completed;

  UseCaseObserverUtil({this.response, this.completed});

  @override
  void onComplete() {
    completed?.call();
  }

  @override
  void onError(e) {
    if (e is Exception) {
      response?.call(null, null, e);
    } else if (e is E) {
      response?.call(null, e, null);
    }
  }

  @override
  void onNext(T? response) {
    this.response?.call(response, null, null);
  }
}
