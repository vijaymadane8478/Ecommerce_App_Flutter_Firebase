import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onboardingNextButton extends StatelessWidget {
  const onboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    //controller instace
    final controller = onBoardingController.instance;
    return Positioned(
      left: 0,
      right: 0,
      bottom: USizes.spaceBtwItems,
      child: UElevatedButton(
        onPressed: controller.nextPage,
        child: Obx(
          () =>
              Text(controller.currentIndex.value == 2 ? 'GetStarted' : 'Next'),
        ),
      ),
    );
  }
}
