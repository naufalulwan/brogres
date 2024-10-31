import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_util.dart';
import '../utils/shadow_util.dart';

class ButtonBlackWidget extends StatelessWidget {
  const ButtonBlackWidget(
      {super.key,
      this.onPressed,
      this.text,
      this.icon,
      this.width = double.infinity});

  final void Function()? onPressed;
  final String? text;
  final double? width;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: width ?? double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: ColorUtil().tertiaryBlack,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: [ShadowUtil.boxButton()]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            onTap: onPressed,
            child: Center(
              child: icon == null
                  ? Text(
                      text ?? "",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      icon,
                      color: Colors.white,
                      size: 31,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
