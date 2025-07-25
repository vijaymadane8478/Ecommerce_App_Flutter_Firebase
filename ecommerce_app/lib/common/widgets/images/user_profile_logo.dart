import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:flutter/material.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;
    return UCircularImage(
      image:
          isProfileAvailable
              ? controller.user.value.profilePicture
              : UImages.profileLogo,
      height: 120,
      width: 120,
      borderWidth: 5.0,
      padding: 0,
      isNetworkImage: isProfileAvailable ? true : false,
    );
  }
}
