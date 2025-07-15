import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/user_profile_logo.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfilewithEditIcon extends StatelessWidget {
  const UserProfilewithEditIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: UserProfileLogo()),

        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(child: UCircularIcon(icon: Iconsax.edit)),
        ),
      ],
    );
  }
}
