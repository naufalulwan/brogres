import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

Widget textFieldWidget({
  GlobalKey<State<StatefulWidget>>? textfieldKey,
  required TextEditingController controller,
  TextInputAction? textInputAction,
  TextInputType? textInputType,
  String? title,
  String? hintText,
  String? textAddOn,
  bool? isAddTitle,
  bool isAddOn = false,
  bool isTextVisibility = false,
  RxBool? isObscureText,
  void Function()? onTap,
  void Function()? onTapAddOn,
  void Function()? onTapObscure,
  void Function(String)? onChanged,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isAddTitle!) ...[
            Text(
              title!,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorHelper.tertiaryBlack),
            ),
          ],
          if (isAddOn) ...[
            GestureDetector(
              onTap: onTapAddOn,
              child: Text(
                textAddOn ?? "",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorHelper.touchesBlue),
              ),
            )
          ]
        ],
      ),
      const Gap(10),
      TextFormField(
          key: textfieldKey,
          onTap: onTap,
          keyboardType: textInputType,
          textInputAction: textInputAction ?? TextInputAction.done,
          controller: controller,
          obscureText: isTextVisibility ? isObscureText!.value : false,
          onChanged: onChanged,
          validator: validator,
          decoration: DecorationInputUtil(
              controller: controller,
              hintText: hintText,
              isObscureText: isObscureText?.value,
              isTextVisibility: isTextVisibility,
              onPressed: onTapObscure)),
    ],
  );
}
