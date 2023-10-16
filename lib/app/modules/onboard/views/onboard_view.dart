import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/constants/assets_string.dart';
import '../../../data/constants/color.dart';
import '../../../data/widgets/onboarding/onboarding_next.dart';
import '../../../data/widgets/onboarding/onboarding_page.dart';
import '../../../data/widgets/onboarding/onboarding_skip.dart';
import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardController());

    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
              image: iBoard1,
              title: iTitle1,
              desc: iDesc1,
            ),
            OnBoardingPage(
              image: iBoard2,
              title: iTitle2,
              desc: iDesc2,
            ),
            OnBoardingPage(
              image: iBoard3,
              title: iTitle3,
              desc: iDesc3,
            ),
          ],
        ),
        const OnBoardingSkip(),
        Positioned(
          bottom: 50,
          left: 20,
          child: SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3,
            effect:
                const ExpandingDotsEffect(activeDotColor: cBlue, dotHeight: 6),
          ),
        ),
        const OnBoardingNextButton(),
      ]),
    );
  }
}
