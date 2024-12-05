part of '../../auth.dart';

class LoginButtonComponent extends StatelessWidget {
  const LoginButtonComponent(
      {super.key, this.formKey, this.onPressedLogin, this.onForgotBiometric});

  final GlobalKey<FormState>? formKey;
  final void Function()? onPressedLogin;
  final void Function()? onForgotBiometric;
  static final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Obx(() {
        return buttonOrangeWidget(
            text: "Login",
            isLoading: controller.isLoading.value,
            onPressed: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              if (formKey!.currentState!.validate()) {
                onPressedLogin!();
              }
            });
      }),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          lineWidget(context),
          const Gap(8),
          Text(
            "Atau Login Dengan",
            style: GoogleFonts.poppins(color: ColorHelper.tertiaryBlack),
          ),
          const Gap(8),
          lineWidget(context),
        ],
      ),
      const Gap(24),
      InkWell(
        onTap: onForgotBiometric,
        child: Image.asset(
          "assets/icons/icon-fingerprint.png",
          width: 76,
        ),
      )
    ]);
  }
}
