import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductQuantitywithAddRemove extends StatelessWidget {
  const UProductQuantitywithAddRemove({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);
    return Row(
      children: [
        //increment button
        UCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          color: dark ? UColors.white : UColors.black,
          backgroundColor: dark ? UColors.darkGrey : UColors.light,
        ),

        SizedBox(width: USizes.spaceBtwItems),

        //COunter text
        Text("2", style: Theme.of(context).textTheme.titleSmall),

        SizedBox(width: USizes.spaceBtwItems),

        //Decrement Button
        UCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          color: UColors.white,
          backgroundColor: UColors.primary,
        ),
      ],
    );
  }
}
