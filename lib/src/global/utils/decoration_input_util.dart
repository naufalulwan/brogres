import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

class DecorationInputUtil extends InputDecoration {
  DecorationInputUtil({
    required TextEditingController controller,
    super.hintText,
    bool? isTextVisibility,
    bool? isObscureText,
    void Function()? onPressed,
  }) : super(
            contentPadding: const EdgeInsets.only(left: 16),
            hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
            suffixIcon: isTextVisibility!
                ? Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: IconButton(
                        onPressed: onPressed,
                        icon: Icon(isObscureText!
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded)),
                  )
                : const SizedBox.shrink(),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorHelper.tertiaryBlack, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorHelper.primaryOrange, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorHelper.errorRed, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorHelper.errorRed, width: 1),
              borderRadius: BorderRadius.circular(10),
            ));
}
