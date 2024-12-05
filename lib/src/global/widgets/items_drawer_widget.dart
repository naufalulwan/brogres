import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

Widget itemsDrawerWidget() {
  return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 20),
          onTap: () {
            if (index == 1) {
              context.pop();
              context.push(RouteString.productScreen);
            }
          },
          leading: Icon(
            index == 0 ? Icons.help_outline : Icons.inventory_2,
            size: 28,
            color: ColorHelper.primaryOrange,
          ),
          title: Text(
            index == 0 ? "Bantuan" : "Product",
            style: GoogleFonts.poppins(
              color: ColorHelper.tertiaryBlack,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      });
}

Widget bottomDrawerWidget(BuildContext context) {
  return SafeArea(
      child: Container(
    height: 55,
    color: ColorHelper.primaryOrange,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.pushReplacement(RouteString.loginScreen);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Logout",
                style: GoogleFonts.poppins(
                    color: ColorHelper.tertiaryBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.logout,
                color: ColorHelper.tertiaryBlack,
              )
            ],
          ),
        ),
      ),
    ),
  ));
}
