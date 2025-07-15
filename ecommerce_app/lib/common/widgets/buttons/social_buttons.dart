import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UsocialButton extends StatelessWidget {
  const UsocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //gogogle button
        buildButton(UImages.facebookIcon, () {}),
        SizedBox(width: USizes.spaceBtwItems),
        //facebook button
        buildButton(UImages.googleIcon, () {}),
      ],
    );
  }

  Container buildButton(String image, VoidCallback onpressed) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: UColors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(image, height: USizes.iconMd, width: USizes.iconMd),
      ),
    );
  }
}
