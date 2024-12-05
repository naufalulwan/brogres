part of '../../auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AssetString.useLoginDeco,
            height: SizeUtil.screenHeight(context),
            width: SizeUtil.screenWidth(context),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: SizeUtil.screenHeight(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Image.asset(
                      AssetString.iconHello,
                      width: 180,
                    ),
                  ),
                  Form(
                      key: controller.formKey,
                      child: LoginFormfieldComponent(button: [
                        const Gap(16),
                        const LoginCheckboxComponent(),
                        const Gap(4),
                        LoginButtonComponent(
                            formKey: controller.formKey,
                            onPressedLogin: () async {
                              controller.login(
                                context,
                              );
                            },
                            onForgotBiometric: () {
                              context.push(RouteString.maintenanceScreen);
                            })
                      ])),
                ],
              ),
            ),
          ),
          const LoginRunningtextComponent(
            text:
                "Fusce fermentum, urna eu tempor consequat, ligula nisi dignissim odio, vitae tincidunt lacus sem non lectus. Cras tincidunt augue vel tellus facilisis, at vehicula dui ullamcorper. Phasellus eget nunc a magna ultricies blandit nec vel augue.",
          )
        ],
      ),
    ));
  }
}
