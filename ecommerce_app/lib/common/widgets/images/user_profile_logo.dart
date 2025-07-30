import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effects.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(() {
      bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;

      //Loading State
      if (controller.isProfileUploading.value) {
        return UShimmerEffect(width: 120, height: 120, radius: 120);
      }
      return UCircularImage(
        image:
            isProfileAvailable
                ? controller.user.value.profilePicture.replaceFirst(
                  'http://',
                  'https://',
                )
                : UImages.profileLogo,
        height: 120,
        width: 120,

        borderWidth: 5.0,
        padding: 0,
        isNetworkImage: isProfileAvailable ? true : false,
      );
    });
  }
}
