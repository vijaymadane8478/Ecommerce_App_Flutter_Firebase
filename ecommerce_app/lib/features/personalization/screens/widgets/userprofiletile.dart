import 'package:ecommerce_app/features/personalization/screens/Edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "Unkown Pro",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        "Unkownpro@gmail.com",
        style: Theme.of(context).textTheme.bodyMedium,
      ),

      trailing: IconButton(
        onPressed: () => Get.to(EditProfileScreen()),
        icon: Icon(Iconsax.edit),
      ),
    );
  }
}
