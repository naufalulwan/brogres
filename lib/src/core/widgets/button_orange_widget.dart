import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_util.dart';
import '../utils/shadow_util.dart';

class ButtonOrangeWidget extends StatelessWidget {
  const ButtonOrangeWidget(
      {super.key, this.onPressed, this.text, this.width = double.infinity});

  final void Function()? onPressed;
  final String? text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Ink(
        width: width ?? double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: ColorUtil().primaryOrange,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: [ShadowUtil.boxButton()]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            onTap: onPressed,
            child: Center(
              child: Text(
                text ?? "",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
