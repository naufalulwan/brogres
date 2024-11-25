part of '../dashboard.dart';

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
                  ButtonCart(
                    icon: Icons.shopping_cart_outlined,
                    width: 55,
                    height: 55,
                    onPressed: () {},
                  ),
                  const Gap(12),
                  ButtonPayment(
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
}
