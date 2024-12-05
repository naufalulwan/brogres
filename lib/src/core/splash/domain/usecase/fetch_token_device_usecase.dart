part of '../domain.dart';

class FetchTokenDeviceUseCase extends UseCase<TokenDeviceEntity, void> {
  final SplashRepository splashRepository;
  FetchTokenDeviceUseCase({required this.splashRepository});

  @override
  Future<Stream<TokenDeviceEntity>> buildUseCaseStream(void params) async {
    final controller = StreamController<TokenDeviceEntity>();
    try {
      final data = await splashRepository.fetchTokenSplash();
      data.fold((fail) {
        controller.addError(fail);
      }, (data) {
        controller.add(data);
      });
    } catch (error) {
      controller.addError(ExceptionHelper(error));
    }
    controller.close();
    return controller.stream;
  }
}
