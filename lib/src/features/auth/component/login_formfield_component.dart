part of '../auth.dart';

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
          TextFieldWidget(
            onTap: () {
              controller.ensureVisibleOnTextArea(context);
            },
            controller: controller.usernameController,
            isAddTitle: true,
            title: "Username",
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return "Username harus diisi";
              }

              return null;
            },
          ),
          const Gap(20),
          TextFieldWidget(
            onTap: () {
              controller.ensureVisibleOnTextArea(context);
            },
            controller: controller.passwordController,
            isAddTitle: true,
            isAddOn: true,
            isTextVisibility: true,
            title: "Password",
            textAddOn: "Lupa Password?",
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
          ...?button,
        ],
      ),
    );
  }
}
