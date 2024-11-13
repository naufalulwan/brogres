import 'package:flutter/material.dart';

import 'color_util.dart';

var decoration = ({
  required TextEditingController controller,
  bool? isTextVisibility,
  bool? isObscureText,
  void Function()? onPressed,
}) =>
    InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16),
        suffixIcon: isTextVisibility!
            ? Padding(
                padding: const EdgeInsets.only(right: 4),
                child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(!isObscureText!
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded)),
              )
            : const SizedBox.shrink(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorUtil().tertiaryBlack, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorUtil().primaryOrange, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorUtil().errorRed, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorUtil().errorRed, width: 1),
          borderRadius: BorderRadius.circular(10),
        ));
