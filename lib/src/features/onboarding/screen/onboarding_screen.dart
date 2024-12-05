part of '../onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController controller = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.primaryOrange,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: HardCodeString.onboardingPages.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (_, index) {
              return OnboardingBase(
                title: HardCodeString.onboardingPages[index]["title"],
                description: HardCodeString.onboardingPages[index]
                    ["description"],
                image: HardCodeString.onboardingPages[index]["image"],
                intersect: HardCodeString.onboardingPages[index]["intersect"],
              );
            },
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 24),
            child: SmoothPageIndicator(
              controller: controller, // PageController
              count: HardCodeString.onboardingPages.length,
              effect: WormEffect(
                  activeDotColor: ColorHelper.tertiaryBlack,
                  dotColor: Colors.white,
                  dotHeight: 10,
                  dotWidth: 24,
                  spacing: 12), // your preferred effect
            ),
          ),
          _currentPage == 2
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buttonBlackWidget(
                    text: "Yuk Mulai",
                    onPressed: () {
                      context.pushReplacement(RouteString.loginScreen);
                    },
                  ),
                )
              : buttonNextWidget(
                  onTapSkip: () {
                    controller.jumpToPage(2);
                  },
                  onTapNext: () {
                    if (_currentPage != 2) {
                      controller.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                    }
                  },
                )
        ],
      )),
    );
  }
}
