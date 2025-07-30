import 'package:ecommerce_app/common/widgets/image_texts/vertical_image_text.dart';
import 'package:ecommerce_app/common/widgets/shimmer/category_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
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
    //controller
    final controller = Get.put(CategoryController());
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
          Obx(() {
            final categories = controller.featureCategoris;

            //[Loading state]
            if (controller.isCategoriesLoading.value) {
              return UCategoryShimmer(itemCount: 6);
            }
            //[Empty]
            if (categories.isEmpty) {
              return Text("Categoris Not Foune");
            }
            //[Data found]
            return SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder:
                    (context, index) => SizedBox(width: USizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return UverticalImageText(
                    title: category.name,
                    image: category.image,
                    textcolor: UColors.white,
                    onTap: () => Get.to(() => SubCategoryScreen()),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
