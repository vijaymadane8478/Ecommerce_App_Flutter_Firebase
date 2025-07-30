import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/user_profile_logo.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class UserProfilewithEditIcon extends StatelessWidget {
  const UserProfilewithEditIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Stack(
      children: [
        // Profile Image
        const UserProfileLogo(),

        // Positioned Edit Icon in bottom-right corner
        Obx(() {
          if (controller.isProfileUploading.value) {
            return SizedBox();
          }
          return Positioned(
            bottom: 0,
            right: 0,
            child: UCircularIcon(
              icon: Iconsax.edit,
              onPressed: controller.updateUserProfilePicture,
              backgroundColor: Colors.white,
              // size: 32,
              //color: Colors.black,
            ),
          );
        }),
      ],
    );
  }
}
