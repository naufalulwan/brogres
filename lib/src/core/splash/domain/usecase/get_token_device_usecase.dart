part of '../domain.dart';

class GetTokenDeviceUseCase extends UseCase<String, void> {
  final SplashRepository splashRepository;
  GetTokenDeviceUseCase({required this.splashRepository});
  @override
  Future<Stream<String?>> buildUseCaseStream(void params) async {
    final controller = StreamController<String>();
    try {
      final data = await splashRepository.getTokenSplash();
      if (data.isNotEmpty) {
        controller.add(data);
      } else {
        controller.addError("token device tidak ditemukan!");
      }
    } catch (error) {
      controller.addError(ExceptionHelper(error));
    }
    controller.close();
    return controller.stream;
  }
}
