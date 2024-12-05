part of '../domain.dart';

class GetFirstLoginUseCase extends UseCase<bool, void> {
  final SplashRepository splashRepository;

  GetFirstLoginUseCase({required this.splashRepository});
  @override
  Future<Stream<bool?>> buildUseCaseStream(void params) async {
    final controller = StreamController<bool>();
    try {
      final data = await splashRepository.getFirstTimeSplash();
      if (data) {
        controller.add(data);
      } else {
        controller.addError("gagal mendapatkan data first time login");
      }
    } catch (error) {
      controller.addError(ExceptionHelper(error));
    }
    controller.close();
    return controller.stream;
  }
}
