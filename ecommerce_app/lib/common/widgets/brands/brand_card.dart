import 'package:ecommerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:ecommerce_app/common/widgets/texts/brandtittlewithverifyicon.dart';
import 'package:ecommerce_app/utilits/constants/enums.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({super.key, this.showborder = true, this.onTap});

  //cutomize
  final bool showborder;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        height: USizes.brandCardHeight,
        showBorder: showborder,
        padding: EdgeInsets.all(USizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //image brand
            Flexible(
              child: URoundedImage(
                imageUrl: UImages.bataLogo,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems / 2),

            //RIGHT PORTION
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Brand Name and veirfy icon
                  UBrandTitlewithVerifyIcon(
                    title: "Bata",
                    brandTextSize: TextSizes.large,
                  ),

                  //product text
                  Text(
                    "172 products",
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
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
