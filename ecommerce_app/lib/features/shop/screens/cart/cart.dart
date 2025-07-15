import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/products/cart/prouductquantitywithaddremove.dart';
import 'package:ecommerce_app/common/widgets/texts/brandtittlewithverifyicon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price.dart';
import 'package:ecommerce_app/common/widgets/texts/product_titlle.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);
    return Scaffold(
      //.....APPBAR..............
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),
      //......BODY......
      body: Padding(padding: UPadding.screenPadding, child: UCartItems()),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed: () => Get.to(() => CheckOutScreen()),
          child: Text('Checkout \$263527'),
        ),
      ),
    );
  }
}
