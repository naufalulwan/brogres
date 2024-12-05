import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

Future<void> popupWidget(BuildContext context,
    {required String title,
    required String message,
    String? textButton,
    required void Function() onTap}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        color: ColorHelper.tertiaryBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const Gap(15),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(25),
                  buttonOrangeWidget(
                    text: textButton ?? "Coba Lagi",
                    onPressed: () {
                      onTap();
                    },
                  )
                ],
              ),
            ),
          ));
}
