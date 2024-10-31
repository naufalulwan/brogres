import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/asset_string.dart';
import '../core/utils/color_util.dart';
import '../core/widgets/button_orange_widget.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: content()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ButtonOrangeWidget(
          text: "Kembali",
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 38),
              child: Image.asset(
                AssetString.useMaintenance,
                width: 330,
              ),
            ),
            Text(
              "Ups! Layanan Sedang Dalam Perbaikan",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Gap(10),
            Text(
                "Sepertinya tidak ada apa pun di sini. Klik tombol di bawah untuk kembali ke halaman utama.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 12, color: ColorUtil.color("727272"))),
          ],
        ),
      ),
    );
  }
}
