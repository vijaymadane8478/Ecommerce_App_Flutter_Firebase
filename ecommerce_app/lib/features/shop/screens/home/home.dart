import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/prouct_cards/prouct_card_verticals.dart';
import 'package:ecommerce_app/common/widgets/textfields/search_bar.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/home/home_controller.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/homecategoris.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/primary_headercontainer.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';

import 'package:ecommerce_app/utilits/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //upper part.................................................
            Stack(
              children: [
                //total height +10
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
                //primary header
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //AppBar
                      UHomeAppBar(),
                      SizedBox(height: USizes.spaceBtwSections),

                      //categoris
                      UHomeCategoris(),
                    ],
                  ),
                ),

                //search bar
                USearchBar(),
              ],
            ),

            //lower part........................
            Padding(
              padding: EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  //bannner sliding
                  UpromoSlider(),
                  SizedBox(height: USizes.spaceBtwSections),

                  USectionHeading(
                    title: 'Popular Products',
                    onpressed: () => Get.to(() => AllProductsScreen()),
                  ),

                  SizedBox(height: USizes.spaceBtwSections),

                  //GRID OF PRODUCT CARD
                  UGridLayout(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return UProductCardVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
