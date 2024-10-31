import 'package:flutter/material.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/asset_string.dart';
import '../../core/constants/route_string.dart';
import '../../core/utils/color_util.dart';
import '../../core/widgets/button_black_widget.dart';
import '../../core/widgets/button_next_widget.dart';

part 'onboarding_background_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController controller = PageController();

  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "title": "Pelayanan Terjamin",
      "description":
          "Memastikan layanan yang konsisten, berkualitas, dan dapat diandalkan, memberikan rasa aman serta kepuasan pelanggan.",
      "image": AssetString.useOnboarding1,
      "intersect": AssetString.useIntersect1
    },
    {
      "title": "Pembayaran Mudah",
      "description":
          "Menyediakan proses pembayaran yang cepat, sederhana, dan tanpa hambatan untuk kenyamanan pelanggan.",
      "image": AssetString.useOnboarding2,
      "intersect": AssetString.useIntersect2
    },
    {
      "title": "Makanan Istimewa",
      "description":
          "Menawarkan hidangan berkualitas tinggi dengan cita rasa unik yang disiapkan secara khusus untuk memberikan pengalaman kuliner yang berkesan.",
      "image": AssetString.useOnboarding3,
      "intersect": AssetString.useIntersect3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil().primaryOrange,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: _pages.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (_, index) {
              return OnboardingBackgroundScreen(
                title: _pages[index]["title"],
                description: _pages[index]["description"],
                image: _pages[index]["image"],
                intersect: _pages[index]["intersect"],
              );
            },
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 24),
            child: SmoothPageIndicator(
              controller: controller, // PageController
              count: _pages.length,
              effect: WormEffect(
                  activeDotColor: ColorUtil().tertiaryBlack,
                  dotColor: Colors.white,
                  dotHeight: 10,
                  dotWidth: 24,
                  spacing: 12), // your preferred effect
            ),
          ),
          AnimatedSizeAndFade(
            sizeDuration: const Duration(milliseconds: 600),
            child: _currentPage == 2
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ButtonBlackWidget(
                      text: "Yuk Mulai",
                      onPressed: () {
                        context.push(RouteString.loginScreen);
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
                  ),
          )
        ],
      )),
    );
  }
}
