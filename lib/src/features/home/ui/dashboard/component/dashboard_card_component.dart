part of '../dashboard.dart';

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
      margin: const EdgeInsets.only(top: 28),
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
                  width: 32,
                ),
                const Gap(5),
                RichText(
                    text: TextSpan(
                        text: "Insight",
                        style: GoogleFonts.poppins(
                            color: ColorHelper.tertiaryBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        children: [
                      TextSpan(
                          text: ' - ',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: GoogleFonts.poppins()),
                      TextSpan(
                          text: 'Harian',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: GoogleFonts.poppins(
                            color: ColorHelper.touchesBlue,
                          )),
                    ]))
              ],
            ),
            const Gap(21),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pendapatan", style: GoogleFonts.poppins(fontSize: 14)),
                Row(
                  children: [
                    Text(isObscureText ? "Rp. 500,000" : "••••••••••",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    const Gap(9),
                    InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_rounded,
                          size: 20,
                        )),
                  ],
                )
              ],
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Produk Terjual",
                    style: GoogleFonts.poppins(fontSize: 14)),
                Text("30",
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w600))
              ],
            ),
            const Gap(28),
            buttonOrangeWidget(
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
