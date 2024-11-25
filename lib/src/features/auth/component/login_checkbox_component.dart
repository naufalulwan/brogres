part of '../auth.dart';

class LoginCheckboxComponent extends StatelessWidget {
  const LoginCheckboxComponent({super.key});

  static final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() {
          return Checkbox(
              value: controller.isSaveInfo.value,
              activeColor: ColorUtil().primaryOrange,
              onChanged: (value) {
                controller.isSaveInfo.value = !controller.isSaveInfo.value;
              });
        }),
        Text(
          "Simpan Informasi Login",
          style: GoogleFonts.poppins(color: ColorUtil().tertiaryBlack),
        ),
      ],
    );
  }
}
