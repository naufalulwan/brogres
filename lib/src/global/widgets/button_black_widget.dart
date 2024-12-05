import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

Widget buttonBlackWidget({
  final void Function()? onPressed,
  final String? text,
  final double width = double.infinity,
  final IconData? icon,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          color: ColorHelper.tertiaryBlack,
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
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
                : Icon(
                    icon,
                    color: Colors.white,
                    size: 26,
                  ),
          ),
        ),
      ),
    ),
  );
}
