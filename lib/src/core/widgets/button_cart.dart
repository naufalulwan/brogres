import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_util.dart';
import '../utils/shadow_util.dart';

class ButtonCart extends StatelessWidget {
  const ButtonCart(
      {super.key,
      this.onPressed,
      this.text,
      this.icon,
      this.width = 50,
      this.height = 50});

  final void Function()? onPressed;
  final String? text;
  final double? width;
  final double? height;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: text != null ? null : width,
      height: height,
      decoration: BoxDecoration(
          color: ColorUtil().primaryOrange,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [ShadowUtil.boxButton()]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTap: onPressed,
          child: Padding(
            padding: text == null
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: text != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (text != null) ...[
                  Text(
                    text!,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const Gap(15)
                ],
                Icon(
                  icon,
                  color: Colors.white,
                  size: 26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
