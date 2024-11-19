part of 'onboarding_screen.dart';

class OnboardingBackgroundScreen extends StatelessWidget {
  const OnboardingBackgroundScreen(
      {super.key, this.title, this.description, this.image, this.intersect});

  final String? title;
  final String? description;
  final String? image;
  final String? intersect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil().primaryOrange,
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset(intersect ?? AssetString.useIntersect1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 54),
          child: content(),
        ),
      ]),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image ?? AssetString.useOnboarding1, fit: BoxFit.fill),
          Text(
            title ?? "",
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorUtil().tertiaryBlack),
          ),
          const Gap(20),
          Text(
            textAlign: TextAlign.justify,
            description ?? "",
            style: GoogleFonts.titilliumWeb(
                fontSize: 14, color: ColorUtil().tertiaryBlack),
          ),
        ],
      ),
    );
  }
}
