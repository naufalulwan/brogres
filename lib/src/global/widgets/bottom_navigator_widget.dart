import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

Widget bottomNavigatorWidget(BuildContext context) {
  return SafeArea(
    child: Container(
      height: 80,
      width: SizeUtil.screenWidth(context),
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [ShadowUtil.boxContainer(y: -6)]),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Keranjang :",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const Gap(5),
                Text(
                  "0",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                buttonCartWidget(
                  icon: Icons.shopping_cart_outlined,
                  width: 55,
                  height: 55,
                  onPressed: () {},
                ),
                const Gap(12),
                buttonPaymentWidget(
                  icon: Icons.payment,
                  width: 55,
                  height: 55,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
