import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:ecommerce_app/common/widgets/textfields/search_bar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/primary_headercontainer.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UStorePrimaryHeader extends StatelessWidget {
  const UStorePrimaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: USizes.storePrimaryHeaderHeight + 10),
        //primary header
        UPrimaryHeaderContainer(
          height: USizes.storePrimaryHeaderHeight,
          child: UAppBar(
            title: Text(
              "Store",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.apply(color: UColors.white),
            ),
            actions: [UCartCounterIcon()],
          ),
        ),

        //search bar
        USearchBar(),
      ],
    );
  }
}
