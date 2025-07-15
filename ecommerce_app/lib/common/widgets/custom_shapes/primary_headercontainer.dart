import 'package:ecommerce_app/common/widgets/custom_shapes/circular_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/clipper/rounded_edges_container.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';

import 'package:flutter/material.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });
  //cutomize parametes
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return URoundedEdges(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [
            //CIRCULAR CONTAINER
            Positioned(
              top: -150,
              right: -160,
              child: UcircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundcolor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            //CIRCULAR CONTAINER
            Positioned(
              top: 50,
              right: -250,
              child: UcircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundcolor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            //child
            child,
          ],
        ),
      ),
    );
  }
}
