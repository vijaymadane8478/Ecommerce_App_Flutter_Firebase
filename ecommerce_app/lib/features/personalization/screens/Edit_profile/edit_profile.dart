import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';

import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/Edit_profile/widgets/userdetailsrow.dart';
import 'package:ecommerce_app/features/personalization/screens/Edit_profile/widgets/userprofilewithediticon.dart';
import 'package:ecommerce_app/features/personalization/screens/changename/change_name.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              //USER Profile Logo
              UserProfilewithEditIcon(),
              SizedBox(height: USizes.spaceBtwSections),

              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              USectionHeading(
                title: "Account Setting",
                showActionButton: false,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              //ACCOUNT DETAILS
              UserDetailRow(
                title: 'Name',
                value: controller.user.value.fullName,
                onTap: () => Get.to(() => ChangeNameScreen()),
              ),
              UserDetailRow(
                title: 'UserName',
                value: controller.user.value.username,
                onTap: () {},
              ),

              SizedBox(height: USizes.spaceBtwItems),

              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              //Profile Section Heading
              USectionHeading(
                title: "Profile Setting",
                showActionButton: false,
              ),

              SizedBox(height: USizes.spaceBtwItems),
              //Profile settings
              UserDetailRow(
                title: 'User ID',
                value: controller.user.value.id,
                onTap: () {},
              ),
              UserDetailRow(
                title: 'Email',
                value: controller.user.value.email,
                onTap: () {},
              ),
              UserDetailRow(
                title: 'Phone Number',
                value: '+91 ${controller.user.value.phoneNumber}',
                onTap: () {},
              ),
              UserDetailRow(title: 'Gender', value: "Male", onTap: () {}),

              SizedBox(height: USizes.spaceBtwItems),

              //Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              TextButton(
                onPressed: () => controller.deletAccountWarningPopup(),
                child: Text(
                  "Close Account",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
