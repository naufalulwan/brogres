part of '../global.dart';

Widget buttonNextWidget(
    {void Function()? onTapSkip, void Function()? onTapNext}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20,
      right: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onTapSkip,
          child: Text(
            "Skip",
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ColorUtil().tertiaryBlack),
          ),
        ),
        ButtonBlackWidget(
          onPressed: onTapNext,
          icon: Icons.arrow_forward_rounded,
          width: 50,
        )
      ],
    ),
  );
}
