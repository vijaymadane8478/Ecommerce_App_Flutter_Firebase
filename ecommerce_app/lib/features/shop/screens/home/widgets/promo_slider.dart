import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effects.dart';
import 'package:ecommerce_app/features/shop/controllers/banner/banner_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/home/home_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/banners_dots_navigation.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpromoSlider extends StatelessWidget {
  const UpromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    //controller getx wala

    final bannercontroller = Get.put(BannerController());
    return Obx(() {
      if (bannercontroller.isLoading.value) {
        return UShimmerEffect(width: double.infinity, height: 190);
      }
      if (bannercontroller.banners.isEmpty) {
        return Text("Banners not Found");
      }
      return Column(
        children: [
          //BANNERS
          CarouselSlider(
            items:
                bannercontroller.banners
                    .map(
                      (banner) => URoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: banner.imageUrl.startsWith("http"),
                        onTap: () => Get.toNamed(banner.targetScreen),
                      ),
                    )
                    .toList(),
            options: CarouselOptions(
              viewportFraction: 1.0,
              onPageChanged:
                  (index, reason) => bannercontroller.OnPageChanged(index),
            ),
            carouselController: bannercontroller.carouselController,
          ),
          //banner Navigation
          SizedBox(height: USizes.spaceBtwItems),
          BannersDotNavigation(),
        ],
      );
    });
  }
}
