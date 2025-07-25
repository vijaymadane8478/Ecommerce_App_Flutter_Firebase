import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utilits/helpers/network_manager.dart';
import 'package:ecommerce_app/utilits/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utilits/popups/snackbar_helpers.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  //variables
  final _userController = UserController.instance;
  final _userRepository = UserRepository.instace;

  //TEXT EDITING controllers
  final firstName = TextEditingController();
  final lastname = TextEditingController();

  //Form key
  final updateUserFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initilaizedNames();
    super.onInit();
  }

  void initilaizedNames() {
    firstName.text = _userController.user.value.firstName;
    lastname.text = _userController.user.value.lastName;
  }

  ///[Update user name]
  ///
  Future<void> updateUserName() async {
    try {
      //START LOADING
      UFullScreenLoader.openLoadingDialog('We are updating your information');
      //CHECK INTERNET CONNECTIVITY
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      //FORM VALIDATION
      if (!updateUserFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      //UPDATE USER NAME FROM FIRE STORE

      Map<String, dynamic> map = {
        'firstName': firstName.text,
        "lastName": lastname.text,
      };
      await _userRepository.updateSingleFields(map);
      //UPDATE USER FROM RX USER
      _userController.user.value.firstName = firstName.text;
      _userController.user.value.lastName = lastname.text;
      //STOP LOADING
      UFullScreenLoader.stopLoading();

      //Navigation
      Get.offAll(() => NavigationMenu());

      //Succes Message
      USnackBarHelpers.successSnackBar(
        title: "Congratulations",
        message: 'Your Name has been updated',
      );
    } catch (e) {
      //STOP LOADING
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: "Update Name Failed!",
        message: e.toString(),
      );
    }
  }
}
