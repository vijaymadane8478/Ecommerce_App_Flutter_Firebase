import 'package:ecommerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USingleAddresses extends StatelessWidget {
  const USingleAddresses({super.key, required this.isselected});

  //customize

  final bool isselected;
  @override
  Widget build(BuildContext context) {
    //customize
    final dark = UHelperFUnctions.inDarkMode(context);
    return URoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor:
          isselected
              ? UColors.primary.withValues(alpha: 0.5)
              : Colors.transparent,
      borderColor:
          isselected
              ? Colors.transparent
              : dark
              ? UColors.darkGrey
              : UColors.grey,
      padding: EdgeInsets.all(USizes.md),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Unkown Pro",
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              // Mobie
              Text("+91 1231231", maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: USizes.spaceBtwItems / 2),
              //Addreses
              Text(
                "Pune Maharashtra India ",
                maxLines: 1,
                //overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          if (isselected)
            Positioned(
              top: 0,
              bottom: 0,
              right: 6,
              child: Icon(Iconsax.tick_circle5),
            ),
        ],
      ),
    );
  }
}
