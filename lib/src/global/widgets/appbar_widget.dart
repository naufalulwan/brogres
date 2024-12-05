import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

PreferredSizeWidget appbarWidget(
  BuildContext context, {
  String? title,
  Color? backgroundColor,
  bool useAction = false,
  bool useLeading = false,
  bool useBack = false,
  IconData? actionIcon,
  IconData? leadingIcon,
  void Function()? onTapAction,
  void Function()? onTapLeading,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(56),
    child: AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leadingWidth: useBack
          ? title != null
              ? SizeUtil.screenWidth(context) * 0.12
              : 88
          : null,
      leading: (useLeading || useBack)
          ? _buildLeading(
              context,
              back: useBack,
              title: title,
              icon: leadingIcon,
              onTap: onTapLeading,
            )
          : null,
      title: _buildTitle(title),
      actions: useAction
          ? [_buildActionButton(icon: actionIcon, onTap: onTapAction)]
          : null,
    ),
  );
}

Widget? _buildTitle(String? title) {
  if (title == null || title.isEmpty) return null;
  return Text(
    title,
    style: GoogleFonts.poppins(
      color: ColorHelper.tertiaryBlack,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget _buildLeading(
  BuildContext context, {
  bool? back,
  String? title,
  IconData? icon,
  void Function()? onTap,
}) {
  return Container(
    margin: title != null
        ? const EdgeInsets.symmetric(vertical: 9, horizontal: 6)
        : EdgeInsets.only(
            top: 6, bottom: 6, left: 6, right: back != true ? 6 : 0),
    child: InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: back == false
          ? onTap
          : () {
              onTap?.call();
              context.pop();
            },
      child: title != null
          ? Icon(
              back == false ? icon : Icons.arrow_back_ios_new,
              color: ColorHelper.tertiaryBlack,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  back == false ? icon : Icons.arrow_back_ios_new,
                  color: ColorHelper.tertiaryBlack,
                ),
                if (back == true) ...[
                  const Gap(5),
                  Text(
                    "Back",
                    style: GoogleFonts.poppins(
                      color: ColorHelper.tertiaryBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(5),
                ]
              ],
            ),
    ),
  );
}

Widget _buildActionButton({IconData? icon, void Function()? onTap}) {
  return Container(
    width: 56,
    height: 56,
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
    child: InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Icon(
        icon,
        color: ColorHelper.tertiaryBlack,
      ),
    ),
  );
}
