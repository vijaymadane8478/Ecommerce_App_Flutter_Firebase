import 'package:ecommerce_app/common/widgets/chips/choice_chips.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price.dart';
import 'package:ecommerce_app/common/widgets/texts/product_titlle.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class UProductAttrubutes extends StatelessWidget {
  const UProductAttrubutes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);
    return Column(
      children: [
        //Selected Attributes Pricing and Description
        URoundedContainer(
          padding: EdgeInsets.all(USizes.md),
          backgroundColor: dark ? UColors.darkGrey : UColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            /// TITLE PRICE STOCK
            children: [
              Row(
                children: [
                  // TEXT>>>>>>Variation Heading
                  USectionHeading(title: "Variation", showActionButton: false),
                  SizedBox(width: USizes.spaceBtwItems),

                  Column(
                    children: [
                      //Price, sale price,Actual price
                      Row(
                        children: [
                          //Text[]--price
                          UProuctTitleText(title: 'Price', smallsize: true),

                          //Actual Price
                          Text(
                            "250",
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: USizes.spaceBtwItems),

                          //Sale Price
                          UProuductPriceText(price: '200'),
                        ],
                      ),

                      //Stock Status
                      Row(
                        children: [
                          UProuctTitleText(title: 'Stock ', smallsize: true),
                          Text(
                            " In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //Attributes Description
              UProuctTitleText(
                title: "This is a product of iphone 11 with 512 GB",
                smallsize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        SizedBox(height: USizes.spaceBtwItems),

        //Atributs.........Colors
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(title: "colors", showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems),

            Wrap(
              spacing: USizes.sm,

              children: [
                UChoiceChip(
                  text: 'Red',
                  selected: true,
                  onSelected: (Value) => {},
                ),
                UChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (Value) => {},
                ),
                UChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (Value) => {},
                ),
              ],
            ),
          ],
        ),

        //Atributes.....SIZES
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(title: "Sizes", showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems),

            Wrap(
              spacing: USizes.sm,

              children: [
                UChoiceChip(
                  text: 'Small',
                  selected: true,
                  onSelected: (Value) => {},
                ),
                UChoiceChip(
                  text: 'Medium',
                  selected: false,
                  onSelected: (Value) => {},
                ),
                UChoiceChip(
                  text: 'Large',
                  selected: false,
                  onSelected: (Value) => {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
