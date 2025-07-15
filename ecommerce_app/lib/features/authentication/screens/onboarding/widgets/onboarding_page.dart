import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:ecommerce_app/utilits/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.animation,
    required this.title,
    required this.subtitle,
  });

  final String animation;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: UDeviceHelper.getAppBarHeight()),
      child: Column(
        children: [
          ///Animation
          Lottie.asset(animation),

          //Titile
          Text(
            UTexts.onBoardingTitle1,
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          ///SUBTITLE
          Text(
            UTexts.onBoardingSubTitle1,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
