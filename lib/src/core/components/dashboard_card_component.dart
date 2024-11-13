import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/asset_string.dart';
import '../constants/route_string.dart';
import '../utils/color_util.dart';
import '../widgets/button_orange_widget.dart';

class DashboardCardComponent extends StatefulWidget {
  const DashboardCardComponent({super.key});

  @override
  State<DashboardCardComponent> createState() => _DashboardCardComponentState();
}

class _DashboardCardComponentState extends State<DashboardCardComponent> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 28),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  AssetString.iconInsight,
                  width: 40,
                ),
                const Gap(5),
                RichText(
                    text: TextSpan(
                        text: "Insight ",
                        style: GoogleFonts.poppins(
                            color: ColorUtil().tertiaryBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        children: [
                      const TextSpan(
                        text: '( ',
                      ),
                      TextSpan(
                          text: 'Harian',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: GoogleFonts.poppins(
                              color: ColorUtil().touchesBlue)),
                      const TextSpan(
                        text: ' )',
                      ),
                    ]))
              ],
            ),
            const Gap(21),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pendapatan", style: GoogleFonts.poppins(fontSize: 16)),
                Row(
                  children: [
                    Text(isObscureText ? "••••••••••" : "Rp. 500,000",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const Gap(9),
                    InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(isObscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_rounded)),
                  ],
                )
              ],
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Produk Terjual",
                    style: GoogleFonts.poppins(fontSize: 16)),
                Text("30",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600))
              ],
            ),
            const Gap(28),
            ButtonOrangeWidget(
              text: "Lihat Laporan",
              onPressed: () {
                context.push(RouteString.reportScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
