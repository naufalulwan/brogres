import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/asset_string.dart';
import '../../core/utils/color_util.dart';
import 'component/dashboard_bottom_component.dart';
import 'component/dashboard_card_component.dart';
import 'component/dashboard_tile_component.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorUtil().primaryOrange,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardCardComponent(),
            const Gap(30),
            Text(
              "Kategori",
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Gap(15),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisExtent: 130),
              itemBuilder: (context, index) {
                return DashboardTileComponent(
                  title: index % 2 == 0 ? "Makanan" : "Minuman",
                  image: index % 2 == 0
                      ? AssetString.useBgCardMakanan
                      : AssetString.useBgCardMinuman,
                  onTap: () {},
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const DashboardBottomComponent(),
    );
  }
}
