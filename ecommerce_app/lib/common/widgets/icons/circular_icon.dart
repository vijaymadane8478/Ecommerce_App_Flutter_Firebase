import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class UCircularIcon extends StatelessWidget {
  const UCircularIcon({
    super.key,
    required this.icon,
    this.size = USizes.iconMd,
    this.backgroundColor,
    this.onPressed,
    this.height,
    this.width,
    this.color,
  });

  final double? width, height, size;
  final IconData? icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color:
            (backgroundColor != null)
                ? backgroundColor
                : dark
                ? UColors.dark.withValues(alpha: 0.9)
                : UColors.light.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
