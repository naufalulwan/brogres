part of '../auth.dart';

class AuthController extends GetxController {
  final LoginUseCase _loginUseCase;

  final isLoading = false.obs;
  final isSaveInfo = false.obs;

  late TextEditingController? usernameController;
  late TextEditingController? passwordController;

  late GlobalKey<State<StatefulWidget>> globalKey;
  late GlobalKey<FormState> formKey;

  AuthController(
    LoginUseCase loginUseCase,
  ) : _loginUseCase = loginUseCase;

  @override
  void onInit() {
    super.onInit();

    usernameController = TextEditingController();
    passwordController = TextEditingController();

    globalKey = GlobalKey<State<StatefulWidget>>();
    formKey = GlobalKey<FormState>();
  }

  @override
  void onClose() {
    usernameController!.dispose();
    passwordController!.dispose();

    super.onClose();
  }

  Future<void> ensureVisibleOnTextArea(
    BuildContext context,
  ) async {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (!context.mounted) return;
      Scrollable.ensureVisible(
        globalKey.currentContext!.mounted ? globalKey.currentContext! : context,
        alignment: 2.3,
        duration: const Duration(milliseconds: 150),
        curve: Curves.decelerate,
      );
    });
  }

  Future<void> login(
    BuildContext context,
  ) async {
    isLoading.value = true;

    String tokenDevice = StoredConfig.get(ShareString.b$tokenDevice);

    final params = LoginRequestEntity(
        username: usernameController!.text,
        password: passwordController!.text,
        deviceId: '12345',
        deviceToken: tokenDevice,
        ssn: '12345',
        isSaveLogin: isSaveInfo.value);
    _loginUseCase.execute(
        UseCaseObserverUtil<LoginEntity, ErrorHandleUtil>(
          response: (data, error, exception) {
            if (data != null) {
              context.pushReplacement(RouteString.dashboardScreen);
            } else if (error != null) {
              DialogUtil.show(context,
                  title: "Terjadi Kesalahan",
                  message: error.message.formatAsSentence(),
                  textButton: "Oke", onTap: () async {
                context.pop();
                await ensureVisibleOnTextArea(context);
              });
            } else if (exception != null) {
              DialogUtil.show(context,
                  title: "Terjadi Kesalahan",
                  message:
                      "Tidak dapat terhubung ke server, silahkan coba lagi",
                  textButton: "Oke", onTap: () async {
                context.pop();
                await ensureVisibleOnTextArea(context);
              });
            }
          },
          completed: () {
            isLoading.value = false;
          },
        ),
        params);
  }
}
