import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/utilits/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingNavigation extends StatelessWidget {
  const onBoardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    //controller
    final controller = onBoardingController.instance;
    return Positioned(
      bottom: UDeviceHelper.getBottomNavigationBarHeight() * 4,
      left: UDeviceHelper.getScreenWidth(context) / 3,
      right: UDeviceHelper.getScreenWidth(context) / 3,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(dotHeight: 10.0),
      ),
    );
  }
}
