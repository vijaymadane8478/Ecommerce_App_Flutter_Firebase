import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:ecommerce_app/common/widgets/texts/brandtittlewithverifyicon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price.dart';
import 'package:ecommerce_app/common/widgets/texts/product_titlle.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_thumnail_slider.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/productmetadata.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/products_attributes.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);
    return Scaffold(
      //..............BODY............
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///>>>>>Product Image with SLIDER..................
            UProuductThumnailAndSlider(),

            Padding(
              padding: UPadding.screenPadding,
              child: Column(
                children: [
                  ////PRODUCT DETAILS
                  //Price, title, stock and brand
                  UProductMetaData(),
                  // Attributes
                  UProductAttrubutes(),
                  SizedBox(height: USizes.spaceBtwSections),
                  // Cheackout Button
                  UElevatedButton(onPressed: () {}, child: Text("Checkout")),
                  SizedBox(height: USizes.spaceBtwSections),
                  // Description
                  USectionHeading(
                    title: "Description",
                    showActionButton: false,
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  ReadMoreText(
                    "This is product of iphone11 with 512 GB,This is product of iphone11 with 512 GB,This is product of iphone11 with 512 GB,This is product of iphone11 with 512 GB,This is product of iphone11 with 512 GB,",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),

      ///.............[BOTTOM NAVIGATION]...........
      bottomNavigationBar: UBottomAddToCart(),
    );
  }
}
