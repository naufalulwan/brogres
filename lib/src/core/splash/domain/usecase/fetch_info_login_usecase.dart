part of '../domain.dart';

class FetchInfoLoginUsecase extends UseCase<InfoLoginEntity, void> {
  final SplashRepository splashRepository;
  FetchInfoLoginUsecase({required this.splashRepository});

  @override
  Future<Stream<InfoLoginEntity>> buildUseCaseStream(void params) async {
    final controller = StreamController<InfoLoginEntity>();
    try {
      final data = await splashRepository.fetchLoginInfo();
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
