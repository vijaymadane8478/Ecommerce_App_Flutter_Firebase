import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class UcircularContainer extends StatelessWidget {
  const UcircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.radius = 400,
    this.backgroundcolor = UColors.white,
    this.padding,
    this.margin,
    this.child,
  });
  //customize
  final double height, width, radius;
  final Color backgroundcolor;
  final EdgeInsetsGeometry? padding, margin;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: backgroundcolor,
      ),
      child: child,
    );
  }
}
