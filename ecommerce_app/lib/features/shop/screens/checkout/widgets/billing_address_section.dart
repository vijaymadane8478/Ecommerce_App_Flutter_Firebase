import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TEXT--Billing Addreses
        USectionHeading(
          title: 'Billing Addreses',
          buttonTitle: 'Change',
          onpressed: () {},
        ),
        Text("Unknown Pro", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.phone, size: USizes.iconSm, color: UColors.darkGrey),
            SizedBox(width: USizes.spaceBtwItems),
            Text("+91 1231231230"),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(
              Icons.location_history,
              size: USizes.iconSm,
              color: UColors.darkGrey,
            ),
            SizedBox(width: USizes.spaceBtwItems),
            Expanded(child: Text("Pune, Maharashtra, India", softWrap: true)),
          ],
        ),
      ],
    );
  }
}
