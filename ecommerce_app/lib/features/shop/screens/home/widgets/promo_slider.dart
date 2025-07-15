import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:ecommerce_app/features/shop/controllers/home/home_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/banners_dots_navigation.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';

class UpromoSlider extends StatelessWidget {
  const UpromoSlider({super.key, required this.banners});

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    //controller getx wala
    final controller = HomeController.instance;
    return Column(
      children: [
        //BANNERS
        CarouselSlider(
          items:
              banners.map((banner) => URoundedImage(imageUrl: banner)).toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            onPageChanged: (index, reason) => controller.OnPageChanged(index),
          ),
          carouselController: controller.carouselController,
        ),
        //banner Navigation
        SizedBox(height: USizes.spaceBtwItems),
        BannersDotNavigation(),
      ],
    );
  }
}
