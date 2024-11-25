part of '../domain.dart';

class LoginUseCase extends UseCase<LoginEntity, LoginRequestEntity> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Stream<LoginEntity?>> buildUseCaseStream(
      LoginRequestEntity? params) async {
    final controller = StreamController<LoginEntity>();

    try {
      final response = await authRepository.login(params!);

      response.fold((fail) {
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
