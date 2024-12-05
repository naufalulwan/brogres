part of '../onboarding.dart';

class OnboardingBase extends StatelessWidget {
  const OnboardingBase(
      {super.key, this.title, this.description, this.image, this.intersect});

  final String? title;
  final String? description;
  final String? image;
  final String? intersect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.primaryOrange,
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
                color: ColorHelper.tertiaryBlack),
          ),
          const Gap(20),
          Text(
            textAlign: TextAlign.justify,
            description ?? "",
            style: GoogleFonts.titilliumWeb(
                fontSize: 14, color: ColorHelper.tertiaryBlack),
          ),
        ],
      ),
    );
  }
}
