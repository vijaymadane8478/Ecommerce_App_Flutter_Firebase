import 'package:ecommerce_app/common/widgets/custom_shapes/circular_container.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class UverticalImageText extends StatelessWidget {
  const UverticalImageText({
    super.key,
    required this.title,
    required this.image,
    required this.textcolor,
    this.backgroundColor,
    this.onTap,
  });
  //cutomize
  final String title, image;
  final Color textcolor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    //dark theme
    bool dark = UHelperFUnctions.inDarkMode(context);
    return GestureDetector(
      onDoubleTap: onTap,
      child: Column(
        children: [
          //Circula Image
          UcircularContainer(
            height: 56,
            width: 56,
            backgroundcolor:
                backgroundColor ?? (dark ? UColors.dark : UColors.light),
            padding: EdgeInsets.all(USizes.sm),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              //color: dark ? UColors.light : UColors.dark,
            ),
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),
          //Title
          SizedBox(
            width: 55,
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: textcolor),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
