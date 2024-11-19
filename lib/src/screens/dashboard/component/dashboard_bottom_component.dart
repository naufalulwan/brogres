import 'package:brogres/src/core/utils/shadow_util.dart';
import 'package:brogres/src/core/utils/size_util.dart';
import 'package:brogres/src/core/widgets/button_payment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/button_cart.dart';

class DashboardBottomComponent extends StatelessWidget {
  const DashboardBottomComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text(
                "Keranjang : 5",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Row(
                children: [
                  ButtonCart(
                    icon: Icons.shopping_cart_outlined,
                    width: 55,
                    height: 55,
                  ),
                  Gap(12),
                  ButtonPayment(
                    icon: Icons.payment,
                    width: 55,
                    height: 55,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
