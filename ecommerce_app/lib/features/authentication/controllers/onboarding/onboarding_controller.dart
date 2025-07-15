import 'package:ecommerce_app/features/authentication/screens/login/loign.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class onBoardingController extends GetxController {
  static onBoardingController get instance => Get.find();

  ///varibles
  final pageController = PageController();
  RxInt currentIndex = 0.obs;

  ///update current index when page scroll
  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  /// jump to specific dot selected page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  ///update current index and jump to the next page
  void nextPage() {
    if (currentIndex.value == 2) {
      Get.offAll(() => LoginScreen());
      return;
    }
    currentIndex.value++;
    pageController.jumpToPage(currentIndex.value);
  }

  ///update current index and jump to last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(currentIndex.value);
  }
}
