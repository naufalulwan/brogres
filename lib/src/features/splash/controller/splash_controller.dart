part of '../splash.dart';

class SplashController extends GetxController {
  final FetchTokenDeviceUseCase fetchTokenSplashUseCase;
  final FetchInfoLoginUsecase fetchInfoLoginUseCase;
  final GetTokenDeviceUseCase getTokenDeviceUseCase;
  final GetFirstLoginUseCase getFirstLoginUseCase;

  final data = Rxn<TokenDeviceEntity>();
  final isLoading = false.obs;

  SplashController(this.fetchTokenSplashUseCase, this.fetchInfoLoginUseCase,
      this.getTokenDeviceUseCase, this.getFirstLoginUseCase);

  void generatePage(BuildContext context) {
    getFirstLoginUseCase.execute(UseCaseObserverUtil<bool, String>(
      response: (success, failed, exception) {
        Future.delayed(const Duration(seconds: 4), () {
          if (context.mounted) {
            if (success != null) {
              context.pushReplacement(RouteString.loginScreen);
            } else if (failed != null || exception != null) {
              context.pushReplacement(RouteString.onboardingScreen);
            }
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          }
        });
      },
    ));
  }

  void fetchDataToken(BuildContext context) {
    fetchTokenSplashUseCase
        .execute(UseCaseObserverUtil<TokenDeviceEntity, ErrorModelHelper>(
      response: (data, error, exception) {
        if (data != null) {
          this.data.value = data;
        } else if (error != null) {
          popupWidget(context,
              title: "Terjadi Kesalahan",
              message: error.message.formatAsSentence(), onTap: () {
            context.pop();
            initSplash(context);
          });
          return;
        } else if (exception != null) {
          popupWidget(context,
              title: "Terjadi Kesalahan",
              message: exception.toString().formatAsSentence(), onTap: () {
            context.pop();
            initSplash(context);
          });
          return;
        }
      },
    ));
  }

  void fetchDataInfoLogin(BuildContext context) {
    fetchInfoLoginUseCase.execute(
        UseCaseObserverUtil<InfoLoginEntity, ErrorModelHelper>(
            response: (data, error, exception) {
      if (data != null) {
        if (context.mounted) generatePage(context);
      } else if (error != null) {
        if (error.code != 0) {
          popupWidget(context,
              title: "Terjadi Kesalahan",
              message: error.message.formatAsSentence(), onTap: () {
            context.pop();
            initSplash(context);
          });
          return;
        } else {
          if (context.mounted) generatePage(context);
        }
      } else if (exception != null) {
        popupWidget(context,
            title: "Terjadi Kesalahan",
            message: exception.toString().formatAsSentence(), onTap: () {
          context.pop();
          initSplash(context);
        });
        return;
      }
    }, completed: () {
      isLoading.value = false;
    }));
  }

  Future<void> initSplash(BuildContext context) async {
    isLoading.value = true;

    getTokenDeviceUseCase.execute(
        UseCaseObserverUtil<String, String>(response: (_, error, exception) {
      if (error != null || exception != null) {
        fetchDataToken(context);
      }
    }, completed: () {
      fetchDataInfoLogin(context);
    }));
  }
}
