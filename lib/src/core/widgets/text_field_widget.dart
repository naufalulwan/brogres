import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_util.dart';
import '../utils/decoration_input_util.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.title,
      this.textfieldKey,
      this.isAddTitle = false,
      this.isAddOn = false,
      this.textAddOn,
      this.onTap,
      this.onTapAddOn,
      this.isTextVisibility = false,
      this.textInputAction,
      this.onChanged,
      this.validator});

  final GlobalKey<State<StatefulWidget>>? textfieldKey;

  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  final String? title;
  final String? textAddOn;

  final bool? isAddTitle;
  final bool? isAddOn;
  final bool? isTextVisibility;

  final void Function()? onTap;
  final void Function()? onTapAddOn;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.isAddTitle!) ...[
              Text(
                widget.title!,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorUtil().tertiaryBlack),
              ),
            ],
            if (widget.isAddOn!) ...[
              GestureDetector(
                onTap: widget.onTapAddOn,
                child: Text(
                  widget.textAddOn ?? "",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorUtil().touchesBlue),
                ),
              )
            ]
          ],
        ),
        const Gap(10),
        textFormField()
      ],
    );
  }

  Widget textFormField() {
    return TextFormField(
        key: widget.textfieldKey,
        onTap: widget.onTap,
        keyboardType: TextInputType.emailAddress,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        controller: widget.controller,
        obscureText: widget.isTextVisibility! ? isObscureText : false,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: decoration(
            controller: widget.controller!,
            isObscureText: isObscureText,
            isTextVisibility: widget.isTextVisibility,
            onPressed: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            }));
  }
}
