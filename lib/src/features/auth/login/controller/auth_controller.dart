part of '../../auth.dart';

class AuthController extends GetxController {
  final LoginUseCase _loginUseCase;

  final isLoading = false.obs;
  final isSaveInfo = false.obs;
  final isObscureText = true.obs;

  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  late GlobalKey<State<StatefulWidget>> globalKey;
  late GlobalKey<FormState> formKey;

  AuthController(
    LoginUseCase loginUseCase,
  ) : _loginUseCase = loginUseCase;

  @override
  void onInit() {
    super.onInit();

    globalKey = GlobalKey<State<StatefulWidget>>();
    formKey = GlobalKey<FormState>();
  }

  @override
  void onClose() {
    usernameController.value.text = '';
    passwordController.value.text = '';

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

    final params = LoginRequestEntity(
        username: usernameController.value.text,
        password: passwordController.value.text,
        deviceId: '12345',
        deviceToken: "token_example",
        ssn: '12345',
        isSaveLogin: isSaveInfo.value);

    _loginUseCase.execute(
        UseCaseObserverUtil<LoginEntity, ErrorModelHelper>(
          response: (data, error, exception) {
            if (data != null) {
              context.pushReplacement(RouteString.dashboardScreen);
            } else if (error != null) {
              popupWidget(context,
                  title: "Terjadi Kesalahan",
                  message: error.message.formatAsSentence(),
                  textButton: "Oke", onTap: () async {
                context.pop();
                await ensureVisibleOnTextArea(context);
              });
            } else if (exception != null) {
              popupWidget(context,
                  title: "Terjadi Kesalahan",
                  message: exception.toString().formatAsSentence(),
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
