import 'package:ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:ecommerce_app/common/widgets/texts/brandtittlewithverifyicon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_titlle.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class UCartItem extends StatelessWidget {
  const UCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);
    return Row(
      children: [
        //PRoduct Image
        URoundedImage(
          imageUrl: UImages.productImage4a,
          height: 60,
          width: 60,
          padding: EdgeInsets.all(USizes.sm),
          backgroundColor: dark ? UColors.darkerGrey : UColors.light,
        ),

        SizedBox(width: USizes.spaceBtwItems),
        //BRAND,NAME, VARIATION
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Brand
              UBrandTitlewithVerifyIcon(title: 'Iphone'),
              //Product Title
              UProuctTitleText(title: 'iphone 11 64GB', maxLines: 1),

              //Variation or Attributes
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Storage ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: '512GB ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
