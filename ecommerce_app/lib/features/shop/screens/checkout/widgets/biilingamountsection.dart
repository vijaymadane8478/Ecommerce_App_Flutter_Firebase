import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBillingAmoutSection extends StatelessWidget {
  const UBillingAmoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //subtotal
        Row(
          children: [
            Expanded(
              child: Text(
                "SubTotal",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Spacer(),
            Text("\$343", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        //Shipping Fees
        Row(
          children: [
            Expanded(
              child: Text(
                "Shipping Fees",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Spacer(),
            Text("\$34", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        //Tax fee
        Row(
          children: [
            Expanded(
              child: Text(
                "Tax Fees",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Spacer(),
            Text("\$343", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        //Order Total
        Row(
          children: [
            Expanded(
              child: Text(
                "Order Total",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Spacer(),
            Text("\$343", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
