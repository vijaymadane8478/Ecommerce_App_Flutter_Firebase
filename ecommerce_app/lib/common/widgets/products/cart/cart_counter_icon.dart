import 'package:ecommerce_app/features/shop/screens/cart/cart.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({
    super.key,
    //required this.dark,
  });

  //final bool dark;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFUnctions.inDarkMode(context);
    return Stack(
      children: [
        //Bag Icon ! Cart Icon
        IconButton(
          onPressed: () => Get.to(() => CartScreen()),
          icon: Icon(Iconsax.shopping_bag),
          color: UColors.light,
        ),
        //Counter Text
        Positioned(
          right: 6.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark ? UColors.light : UColors.dark,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  fontSizeFactor: 0.8,
                  color: dark ? UColors.dark : UColors.light,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
