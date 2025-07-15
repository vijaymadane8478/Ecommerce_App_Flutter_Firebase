import 'package:ecommerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/products/cart/prouductquantitywithaddremove.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;
  //CUtomize
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder:
          (context, index) => SizedBox(height: USizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            //CART ITEM
            UCartItem(),
            if (showAddRemoveButtons) SizedBox(width: USizes.spaceBtwItems),
            //Price,Counter Buttons
            if (showAddRemoveButtons)
              Row(
                children: [
                  //Extra space
                  SizedBox(width: 70),

                  //QUantityButtons
                  UProductQuantitywithAddRemove(),

                  Spacer(),

                  //PRoduct PRice
                  UProuductPriceText(price: '323'),
                ],
              ),
          ],
        );
      },
    );
  }
}
