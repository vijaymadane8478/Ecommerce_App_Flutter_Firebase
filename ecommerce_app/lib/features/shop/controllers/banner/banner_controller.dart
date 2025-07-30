import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/data/repositories/banner/banner_repository.dart';
import 'package:ecommerce_app/features/shop/models/banners_models.dart';
import 'package:ecommerce_app/utilits/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  //Variables
  final _repositroy = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isLoading = false.obs;
  final carouselController = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //Fetch All Banners
  Future<void> fetchBanners() async {
    try {
      //start loading
      isLoading.value = true;

      List<BannerModel> activeBanners = await _repositroy.fetchActiveBanners();
      banners.assignAll(activeBanners);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Failes", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///On Carousel Page Changed

  void OnPageChanged(int index) {
    currentIndex.value = index;
  }
}
