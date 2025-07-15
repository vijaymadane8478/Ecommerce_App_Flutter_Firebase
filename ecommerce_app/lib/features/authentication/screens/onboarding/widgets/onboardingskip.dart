import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/utilits/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onboardingskip extends StatelessWidget {
  const onboardingskip({super.key});

  @override
  Widget build(BuildContext context) {
    //controller instace
    final controller = onBoardingController.instance;
    return Obx(
      () =>
          controller.currentIndex.value == 2
              ? SizedBox()
              : Positioned(
                top: UDeviceHelper.getAppBarHeight(),
                right: 0,
                child: TextButton(
                  onPressed: controller.skipPage,
                  child: Text("Skip"),
                ),
              ),
    );
  }
}
