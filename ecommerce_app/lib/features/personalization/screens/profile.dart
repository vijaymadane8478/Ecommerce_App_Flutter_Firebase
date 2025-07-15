import 'package:ecommerce_app/common/widgets/custom_shapes/primary_headercontainer.dart';
import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/widgets/profileprimaryheader.dart';
import 'package:ecommerce_app/features/personalization/screens/widgets/setting_menu_tile.dart';
import 'package:ecommerce_app/features/personalization/screens/widgets/userprofiletile.dart';
import 'package:ecommerce_app/features/shop/screens/address/address.dart';
import 'package:ecommerce_app/features/shop/screens/order/order.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //primary header
            UProfilePrimaryHeader(),

            Padding(
              padding: EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  //USER PROFILE DETAILS
                  UserProfileTile(),

                  SizedBox(height: USizes.spaceBtwItems),

                  //ACCOUNT SETTING HEADING
                  USectionHeading(
                    title: "Account Setting",
                    showActionButton: false,
                  ),

                  //ACCOUNT SETTING MENU
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Addresses",
                    subtitle: "Set Shopping Delivary addresses",
                    onTap: () => Get.to(() => AddressScreen()),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subtitle: "Add, remove products and move to checkout",
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My orders",
                    subtitle: "In-Progress and Completed orders",
                    onTap: () => Get.to(() => OrderScreen()),
                  ),

                  SizedBox(height: USizes.spaceBtwItems),

                  //LOGOUT
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("Logout"),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
