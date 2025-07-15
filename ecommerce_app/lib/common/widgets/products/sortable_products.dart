import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/prouct_cards/prouct_card_verticals.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UsortableProducts extends StatelessWidget {
  const UsortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Filter fields
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (Value) {},
          items:
              ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest'].map((
                filter,
              ) {
                return DropdownMenuItem(value: filter, child: Text(filter));
              }).toList(),
        ),
        SizedBox(height: USizes.spaceBtwSections),

        //Products
        UGridLayout(
          itemCount: 10,
          itemBuilder: (context, index) {
            return UProductCardVertical();
          },
        ),
      ],
    );
  }
}
