import 'package:ecommerce_app/common/widgets/image_texts/vertical_image_text.dart';
import 'package:ecommerce_app/features/shop/screens/order/sub_category/sub_category.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UHomeCategoris extends StatelessWidget {
  const UHomeCategoris({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: USizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //section heading
          Text(
            UTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwItems),

          //list
          SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder:
                  (context, index) => SizedBox(width: USizes.spaceBtwItems),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return UverticalImageText(
                  title: 'Sports Categories',
                  textcolor: UColors.white,
                  image: UImages.sportsIcon,
                  onTap: () => Get.to(() => SubCategoryScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
