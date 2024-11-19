import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/color_util.dart';

class DashboardTileComponent extends StatelessWidget {
  const DashboardTileComponent({super.key, this.title, this.image, this.onTap});

  final String? title;
  final String? image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image!),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        highlightColor: ColorUtil().primaryOrange,
        onTap: onTap,
        child: Center(
          child: Text(title!,
              softWrap: true,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
