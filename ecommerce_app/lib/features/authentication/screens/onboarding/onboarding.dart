import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboardingnavigation.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboardingnextButton.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboardingskip.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //controller
    final controller = Get.put(onBoardingController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            //Scrollale Page
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnboardingPage(
                  animation: UImages.onboarding1Animation,
                  title: UTexts.onBoardingTitle1,
                  subtitle: UTexts.onBoardingSubTitle1,
                ),
                OnboardingPage(
                  animation: UImages.onboarding2Animation,
                  title: UTexts.onBoardingTitle2,
                  subtitle: UTexts.onBoardingSubTitle2,
                ),
                OnboardingPage(
                  animation: UImages.onboarding3Animation,
                  title: UTexts.onBoardingTitle3,
                  subtitle: UTexts.onBoardingSubTitle3,
                ),
              ],
            ),

            ///Indicator
            onBoardingNavigation(),

            ///Bottom Button
            onboardingNextButton(),

            ///Skip Button
            onboardingskip(),
          ],
        ),
      ),
    );
  }
}
