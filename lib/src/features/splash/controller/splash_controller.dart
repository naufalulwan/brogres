part of '../splash.dart';

class SplashController extends GetxController {
  final FetchTokenSplashUseCase fetchTokenSplashUseCase;

  final data = Rxn<SplashTokenEntity>();
  final isLoading = false.obs;

  SplashController(this.fetchTokenSplashUseCase);

  void generatePage(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      StoredConfig.openBox<LoginEntity>(ShareString.a$authData)
          .then((loginEntity) async {
        bool result =
            await StoredConfig.get(ShareString.b$firstTimeLogin) ?? false;

        if (context.mounted) {
          if (result) {
            context.pushReplacement(RouteString.loginScreen);
          } else {
            context.pushReplacement(RouteString.onboardingScreen);
          }
        }

        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      });
    });
  }

  Future<void> initSplash(BuildContext context) async {
    late String tokenDevice;

    tokenDevice = StoredConfig.get(ShareString.b$tokenDevice);

    if (tokenDevice == '') {
      isLoading.value = true;
      fetchTokenSplashUseCase.execute(
          UseCaseObserverUtil<SplashTokenEntity, ErrorHandleUtil>(
              response: (data, error, exception) {
        if (data != null) {
          this.data.value = data;

          StoredConfig.close();

          generatePage(context);
        } else if (error != null) {
          DialogUtil.show(context,
              title: "Terjadi Kesalahan",
              message: error.message.formatAsSentence(), onTap: () {
            context.pop();
            initSplash(context);
          });
        } else if (exception != null) {
          DialogUtil.show(context,
              title: "Terjadi Kesalahan",
              message: exception.toString(), onTap: () {
            context.pop();
            initSplash(context);
          });
        }
      }, completed: () {
        isLoading.value = false;
      }));
    } else {
      if (context.mounted) generatePage(context);
    }
  }
}
