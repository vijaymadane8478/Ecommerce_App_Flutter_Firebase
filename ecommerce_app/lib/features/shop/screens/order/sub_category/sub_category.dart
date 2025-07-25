import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';

import 'package:ecommerce_app/common/widgets/products/prouct_cards/product_card_horizantal.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';

import 'package:ecommerce_app/utilits/constants/sizes.dart';

import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = UHelperFUnctions.inDarkMode(context);
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Sports",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            //Sub Category
            children: [
              USectionHeading(title: 'Sports', onpressed: () {}),

              //Horizantal Product Card
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder:
                      (context, index) =>
                          SizedBox(width: USizes.spaceBtwItems / 2),

                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return UProductCardHorizontal();
                  },
                ),
              ),

              USectionHeading(title: 'Sports', onpressed: () {}),

              //Horizantal Product Card
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder:
                      (context, index) =>
                          SizedBox(width: USizes.spaceBtwItems / 2),

                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return UProductCardHorizontal();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
