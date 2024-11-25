part of '../dashboard.dart';

class DashboardDrawerComponent extends StatelessWidget {
  const DashboardDrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          profileArea(),
          Container(height: 10, color: ColorUtil().secondaryVanilla),
          Flexible(child: menuItems())
        ],
      ),
      bottomNavigationBar: bottomNavigation(context),
    );
  }

  Widget profileArea() {
    return Container(
      height: 250,
      width: double.infinity,
      color: ColorUtil().primaryOrange,
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
                "Naufal Ulwan",
                style: GoogleFonts.poppins(
                    color: ColorUtil().tertiaryBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(4),
              Text(
                "Admin",
                style: GoogleFonts.poppins(
                    color: ColorUtil().tertiaryBlack,
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
                  onTap: () {},
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

  Widget menuItems() {
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
              color: ColorUtil().primaryOrange,
            ),
            title: Text(
              index == 0 ? "Bantuan" : "Product",
              style: GoogleFonts.poppins(
                color: ColorUtil().tertiaryBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        });
  }

  Widget bottomNavigation(BuildContext context) {
    return SafeArea(
        child: Container(
      height: 55,
      color: ColorUtil().primaryOrange,
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
                      color: ColorUtil().tertiaryBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.logout,
                  color: ColorUtil().tertiaryBlack,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
