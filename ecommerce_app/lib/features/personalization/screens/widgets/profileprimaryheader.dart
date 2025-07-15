import 'package:ecommerce_app/common/widgets/custom_shapes/primary_headercontainer.dart';
import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/common/widgets/images/user_profile_logo.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProfilePrimaryHeader extends StatelessWidget {
  const UProfilePrimaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Total Height
        SizedBox(height: USizes.profilePrimaryHeaderHeight + 60),

        // Primary Header
        UPrimaryHeaderContainer(
          height: USizes.profilePrimaryHeaderHeight,
          child: Container(),
        ),

        //USer Profile
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(child: UserProfileLogo()),
        ),
      ],
    );
  }
}
