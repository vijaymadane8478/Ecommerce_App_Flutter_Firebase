import 'package:ecommerce_app/utilits/helpers/network_manager.dart';
import 'package:get/get.dart';

class UBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    //Get.put(VariationController());
    //Get.put(CheckoutController());
    //Get.put(AddressController());
  }
}
