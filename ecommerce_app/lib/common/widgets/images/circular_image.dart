import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class UCircularImage extends StatelessWidget {
  const UCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = USizes.sm,
    this.isNetworkImage = false,
    this.showBorder = false,
    this.borderColor = UColors.primary,
    this.borderWidth = 1.0,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? UColors.dark : UColors.light),
        borderRadius: BorderRadius.circular(100),
        border:
            showBorder
                ? Border.all(color: borderColor, width: borderWidth)
                : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image:
              isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider,
        ),
      ),
    );
  }
}
