import 'package:brogres/src/global/global.dart';

class ExceptionHelper implements Exception {
  final Object message;

  ExceptionHelper(this.message) {
    PrintHelper.logSystem("Error: $message", type: PrintType.exception);
  }

  @override
  String toString() => message.toString();
}
