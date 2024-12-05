import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    this.username,
    this.label,
    this.onEdit,
  });

  final String? username;
  final String? label;

  final void Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          profileArea(),
          Container(height: 10, color: ColorHelper.secondaryVanilla),
          Flexible(child: itemsDrawerWidget())
        ],
      ),
      bottomNavigationBar: bottomDrawerWidget(context),
    );
  }

  Widget profileArea() {
    return Container(
      height: 250,
      width: double.infinity,
      color: ColorHelper.primaryOrange,
      child: SafeArea(
        child: Stack(alignment: Alignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 115,
                width: 115,
                child: CircleAvatar(),
              ),
              const Gap(12),
              Text(
                username ?? "",
                style: GoogleFonts.poppins(
                    color: ColorHelper.tertiaryBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(4),
              Text(
                label ?? "",
                style: GoogleFonts.poppins(
                    color: ColorHelper.tertiaryBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Positioned(
              top: 10,
              right: 15,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: onEdit,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      AssetString.iconEdit,
                      width: 25,
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
