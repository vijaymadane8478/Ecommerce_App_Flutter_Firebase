import 'package:ecommerce_app/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_app/common/widgets/brands/brand_card.dart';

import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_app/features/shop/screens/brands/all_brands.dart';

import 'package:ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/storeprimaryheader.dart';

import 'package:ecommerce_app/utilits/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //controller
    final controller = CategoryController.instance;

    return DefaultTabController(
      length: controller.featureCategoris.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 340,
                pinned: true,
                floating: false,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      //primary header
                      UStorePrimaryHeader(),

                      //brands heading
                      USectionHeading(
                        title: "Brands",
                        onpressed: () => Get.to(() => BrandScreen()),
                      ),

                      SizedBox(height: USizes.spaceBtwItems),

                      //BRAND CARD
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: USizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: USizes.brandCardHeight,
                              child: ListView.separated(
                                separatorBuilder:
                                    (context, index) =>
                                        SizedBox(width: USizes.spaceBtwItems),
                                shrinkWrap: true,
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (context, index) => SizedBox(
                                      width: USizes.brandCardWidth,
                                      child: UBrandCard(onTap: () {}),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //
                bottom: UTabBar(
                  tabs:
                      controller.featureCategoris
                          .map((category) => Tab(child: Text(category.name)))
                          .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children:
                controller.featureCategoris
                    .map((category) => UCategoryTab())
                    .toList(),
          ),
        ),
      ),
    );
  }
}
