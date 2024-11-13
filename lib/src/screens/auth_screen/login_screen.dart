import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

import '../../core/constants/asset_string.dart';
import '../../core/constants/route_string.dart';
import '../../core/utils/color_util.dart';
import '../../core/utils/size_util.dart';
import '../../core/widgets/button_orange_widget.dart';
import '../../core/widgets/leading_widget.dart';
import '../../core/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _keyfield1 = GlobalKey<State<StatefulWidget>>();
  final _keyfield2 = GlobalKey<State<StatefulWidget>>();

  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();

  bool isChecked = false;

  Future<void> ensureVisibleOnTextArea(
      {required GlobalKey textfieldKey, int? index}) async {
    final keyContext = textfieldKey.currentContext;

    if (keyContext != null) {
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (value) => Scrollable.ensureVisible(
          mounted ? keyContext : context,
          alignment: index == 0 ? 0.4 : 0.62,
          duration: const Duration(milliseconds: 150),
          curve: Curves.decelerate,
        ),
      );
    }
  }

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
                      width: 200,
                    ),
                  ),
                  Form(key: _formKey, child: formField(context)),
                ],
              ),
            ),
          ),
          runningText(context)
        ],
      ),
    ));
  }

  Widget runningText(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(color: ColorUtil().primaryOrange),
      child: Marquee(
        text:
            'Fusce fermentum, urna eu tempor consequat, ligula nisi dignissim odio, vitae tincidunt lacus sem non lectus. Cras tincidunt augue vel tellus facilisis, at vehicula dui ullamcorper. Phasellus eget nunc a magna ultricies blandit nec vel augue.',
        style:
            GoogleFonts.poppins(fontSize: 14, color: ColorUtil().tertiaryBlack),
      ),
    );
  }

  Widget formField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
      child: Column(
        children: [
          TextFieldWidget(
            textfieldKey: _keyfield1,
            onTap: () {
              ensureVisibleOnTextArea(textfieldKey: _keyfield1, index: 0);
            },
            controller: emailController,
            isAddTitle: true,
            title: "Email",
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email harus diisi";
              }

              return null;
            },
          ),
          const Gap(20),
          TextFieldWidget(
            textfieldKey: _keyfield2,
            onTap: () {
              ensureVisibleOnTextArea(textfieldKey: _keyfield2, index: 1);
            },
            controller: passwordController,
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
          const Gap(16),
          checkBox(),
          const Gap(4),
          ButtonOrangeWidget(
            text: "Login",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.push(RouteString.dashboardScreen);
              }
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leadingWidget(context),
              const Gap(8),
              Text(
                "Atau Login Dengan",
                style: GoogleFonts.poppins(color: ColorUtil().tertiaryBlack),
              ),
              const Gap(8),
              leadingWidget(context),
            ],
          ),
          const Gap(24),
          InkWell(
            onTap: () {
              context.push(RouteString.maintenanceScreen);
            },
            child: Image.asset(
              "assets/icons/icon-fingerprint.png",
              width: 76,
            ),
          )
        ],
      ),
    );
  }

  Widget checkBox() {
    return Row(
      children: [
        Checkbox(
            value: isChecked,
            activeColor: ColorUtil().primaryOrange,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
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
