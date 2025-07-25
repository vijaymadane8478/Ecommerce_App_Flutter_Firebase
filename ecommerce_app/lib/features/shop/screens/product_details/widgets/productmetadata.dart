import 'package:ecommerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brandtittlewithverifyicon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price.dart';
import 'package:ecommerce_app/common/widgets/texts/product_titlle.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///
        ///
        ///SALE TAG, SALE PRICE, ACUTAL PRICE , SHARE
        Row(
          children: [
            //Sale Tag
            URoundedContainer(
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

            SizedBox(width: USizes.spaceBtwItems),

            //Sale price
            Text(
              "\$250",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),

            SizedBox(width: USizes.spaceBtwItems),

            //Actual Price
            UProuductPriceText(price: "150", isLarge: true),
            SizedBox(width: USizes.spaceBtwItems),

            Spacer(),

            //Share Button........
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),

        SizedBox(height: USizes.spaceBtwItems / 1.5),

        //
        //PRODUCT TITLE
        //
        UProuctTitleText(title: 'Apple iPhone11 '),
        SizedBox(height: USizes.spaceBtwItems / 1.5),

        //
        //
        //PRODUCT STATUS
        Row(
          children: [
            UProuctTitleText(title: ' status'),
            SizedBox(width: USizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        //PRODUCT BRAND IMAGE WITH TITLE
        Row(
          children: [
            //Brand Image
            UCircularImage(
              padding: 0,
              image: UImages.appleLogo,
              width: 32.0,
              height: 32.0,
            ),
            SizedBox(width: USizes.spaceBtwItems),

            //Brand title
            UBrandTitlewithVerifyIcon(title: "Apple"),
          ],
        ),
      ],
    );
  }
}
