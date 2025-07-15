import 'package:ecommerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:ecommerce_app/common/widgets/texts/brandtittlewithverifyicon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price.dart';
import 'package:ecommerce_app/common/widgets/texts/product_titlle.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
        color: dark ? UColors.darkerGrey : UColors.light,
      ),
      child: Row(
        children: [
          //LEFT PORTION
          URoundedContainer(
            height: 120,
            padding: EdgeInsets.all(USizes.sm),
            backgroundColor: dark ? UColors.dark : UColors.light,
            child: Stack(
              children: [
                //Thumnail
                SizedBox(
                  width: 120,
                  height: 120,
                  child: URoundedImage(imageUrl: UImages.productImage15),
                ),
                //Sale Tag
                Positioned(
                  top: 12.0,
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                    padding: EdgeInsets.symmetric(
                      horizontal: USizes.sm,
                      vertical: USizes.xs,
                    ),
                    child: Text(
                      "20%",
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: UColors.black),
                    ),
                  ),
                ),
                //Favurite Icon
                Positioned(
                  right: 0,
                  top: 0,
                  child: UCircularIcon(
                    icon: Iconsax.heart5,
                    color: UColors.error,
                  ),
                ),
              ],
            ),
          ),

          //Right Portion
          SizedBox(
            width: 170,
            child: Padding(
              padding: EdgeInsets.only(left: USizes.sm, top: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Product Title
                      UProuctTitleText(
                        title: 'Blue Bata Shoes',
                        smallsize: true,
                      ),
                      SizedBox(height: USizes.spaceBtwItems / 2),

                      //Product Brand
                      UBrandTitlewithVerifyIcon(title: "Bata"),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: UProuductPriceText(price: '65')),
                      //ADD BUTTON
                      Container(
                        width: USizes.iconLg * 1.2,
                        height: USizes.iconLg * 1.2,
                        decoration: BoxDecoration(
                          color: UColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              USizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: Icon(Iconsax.add, color: UColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
