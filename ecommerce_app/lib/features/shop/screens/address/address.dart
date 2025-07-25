import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';

import 'package:ecommerce_app/features/shop/screens/address/add_new_addresses.dart';
import 'package:ecommerce_app/features/shop/screens/address/widget/single_addresses.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar...........
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      //BODY..........
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              USingleAddresses(isselected: true),
              SizedBox(height: USizes.spaceBtwItems),
              USingleAddresses(isselected: false),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddnewAddressScreen()),
        backgroundColor: UColors.primary,
        child: Icon(Icons.add),
      ),
    );
  }
}
