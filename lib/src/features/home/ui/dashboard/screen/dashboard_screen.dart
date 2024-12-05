part of '../dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardCardComponent(),
          const Gap(30),
          Text(
            "Kategori",
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
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
                onTap: () {
                  context.pushNamed(RouteString.productScreen,
                      extra: index % 2 == 0 ? "Makanan" : "Minuman");
                },
              );
            },
          )
        ],
      ),
    );
  }
}
