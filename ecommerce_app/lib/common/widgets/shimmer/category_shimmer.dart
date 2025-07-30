import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effects.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UCategoryShimmer extends StatelessWidget {
  const UCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder:
            (context, index) => const SizedBox(width: USizes.spaceBtwItems),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              UShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: USizes.spaceBtwItems / 2),

              /// Text
              UShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
