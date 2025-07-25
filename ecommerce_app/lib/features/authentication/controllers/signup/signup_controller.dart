import 'dart:developer';

import 'package:ecommerce_app/data/repositories/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_models.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/utilits/helpers/network_manager.dart';
import 'package:ecommerce_app/utilits/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utilits/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables

  final signUpFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  //text controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  final password = TextEditingController();

  //Function to register user with email and password
  Future<void> registerUser() async {
    try {
      //Start Loading
      log("MYAPPP...start lodading");
      UFullScreenLoader.openLoadingDialog("We are Processing Your Information");

      // Check Internet Connectivity
      log("MYAPPP...network checked");
      bool isConnected = await NetworkManager.instance.isConnected(); // ✅ Fixed
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "No Internet Connection ");
        return;
      }

      /* if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "No Internet Connection ");
        return;
      }
      */

      //Check Privacy Policy
      log("MYAPPP...privacy and policy");
      if (!privacyPolicy.value) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              'In order to create account,you must have to read and accept the Privacy Policy & Terms to use',
        );
        return;
      }
      log("MYAPPP...form validated");
      //Form Validations
      if (!signUpFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading(); // ❗ Important to stop loader
        return;
      }

      log("MYAPPP...user register");
      //USER REGISTRATION using firbase authentication
      UserCredential userCredential = await AuthenticationRepository.instance
          .registerUser(email.text.trim(), password.text.trim());

      //Create User Model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        username: '${firstName.text}${lastName.text}123123',
        email: email.text.trim(),
        phoneNumber: phonenumber.text.trim(),
        profilePicture: '',
      );

      log("MYAPPP...Save user");
      //Save User Record
      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(userModel);

      //Succes Message
      log("MYAPPP...User saved");
      USnackBarHelpers.successSnackBar(
        title: "Congratulations",
        message: "Your account has been created! Verify Email to Continue",
      );

      //Stop Loading
      log("MYAPPP...stopo lodading");
      UFullScreenLoader.stopLoading();

      //redirect to verify email screen
      Get.to(() => VerifilemailScreen(email: email.text));
    } catch (e, stackTrace) {
      log("MYAPPP...ERROR: $e");
      log("MYAPPP...STACKTRACE: $stackTrace");
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
