import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/brands/brand_products.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text("Brand", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: UPadding.screenPadding,
        child: Column(
          children: [
            USectionHeading(title: 'Brands', showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems),
            UGridLayout(
              itemCount: 10,
              itemBuilder:
                  (context, index) => UBrandCard(
                    onTap: () => Get.to(() => BrandProductScreen()),
                  ),
              mainAxisExtent: 80,
            ),
          ],
        ),
      ),
    );
  }
}
