import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../global.dart';

Widget buttonOrangeWidget({
  void Function()? onPressed,
  String? text,
  bool isLoading = false,
  double width = double.infinity,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Ink(
      width: width,
      height: 45,
      decoration: BoxDecoration(
          color: !isLoading
              ? ColorHelper.primaryOrange
              : ColorHelper.disabledAnthracite,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [ShadowUtil.boxButton()]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTap: !isLoading ? onPressed : () {},
          child: Center(
            child: !isLoading
                ? Text(
                    text ?? "",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
                : LoadingAnimationWidget.progressiveDots(
                    color: ColorHelper.secondaryVanilla, size: 30),
          ),
        ),
      ),
    ),
  );
}
