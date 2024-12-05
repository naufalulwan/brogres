part of '../../auth.dart';

class LoginFormfieldComponent extends StatelessWidget {
  const LoginFormfieldComponent({super.key, this.button});

  static final controller = Get.find<AuthController>();

  final List<Widget>? button;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
      child: Column(
        key: controller.globalKey,
        children: [
          textFieldWidget(
            controller: controller.usernameController.value,
            isAddTitle: true,
            title: "Username",
            hintText: "Masukan Username",
            textInputAction: TextInputAction.next,
            onTap: () {
              controller.ensureVisibleOnTextArea(context);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Username harus diisi";
              }

              return null;
            },
          ),
          const Gap(20),
          Obx(
            () => textFieldWidget(
              controller: controller.passwordController.value,
              isAddTitle: true,
              isAddOn: true,
              isTextVisibility: true,
              isObscureText: controller.isObscureText,
              textInputType: TextInputType.visiblePassword,
              title: "Password",
              hintText: "Masukan Password",
              textAddOn: "Lupa Password?",
              onTap: () {
                controller.ensureVisibleOnTextArea(context);
              },
              onTapObscure: () {
                controller.isObscureText.value =
                    !controller.isObscureText.value;

                controller.isObscureText.refresh();
              },
              onTapAddOn: () {
                context.push(RouteString.maintenanceScreen);
              },
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password harus diisi";
                }
                return null;
              },
            ),
          ),
          ...?button,
        ],
      ),
    );
  }
}
