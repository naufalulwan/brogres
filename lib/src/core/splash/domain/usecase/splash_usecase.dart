part of '../domain.dart';

class FetchTokenSplashUseCase extends UseCase<SplashTokenEntity, void> {
  final SplashRepository splashRepository;

  FetchTokenSplashUseCase({required this.splashRepository});

  @override
  Future<Stream<SplashTokenEntity>> buildUseCaseStream(void params) async {
    final controller = StreamController<SplashTokenEntity>();

    try {
      final data = await splashRepository.fetchTokenSplash();

      data.fold((fail) {
        controller.addError(fail);
      }, (data) {
        controller.add(data);
      });
      controller.close();
    } catch (error) {
      controller.addError(Exception(error));
    }

    return controller.stream;
  }
}
