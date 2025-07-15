import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  //variable
  final carouselController = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  ///On Carousel Page Changed

  void OnPageChanged(int index) {
    currentIndex.value = index;
  }
}
