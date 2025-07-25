import 'dart:developer';

import 'package:ecommerce_app/data/repositories/authentication_repository.dart';
import 'package:ecommerce_app/features/authentication/screens/forgot_password/reset_password.dart';
import 'package:ecommerce_app/utilits/helpers/network_manager.dart';
import 'package:ecommerce_app/utilits/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utilits/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //Variables
  final email = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  //Send Email To Forget Password

  Future<void> sendPasswordResetEmail() async {
    try {
      //START LOADING
      log("Ecommerce-start loding");
      UFullScreenLoader.openLoadingDialog("logging you in..");
      //CHEACK INTERNET CONNECTIVITY

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        log("Ecommerce-INTERNET CONNECTIVITY");
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }
      //Form Validate

      if (!forgetPasswordFormKey.currentState!.validate()) {
        log("Ecommerce-Form Validate");
        UFullScreenLoader.stopLoading();
        return;
      }
      //Send Password Reset mail
      AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      //Stop loading
      UFullScreenLoader.stopLoading();

      //Success Message
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Send to Reset Your Password',
      );

      //Redirect
      Get.to(() => resetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Failed Forget Password',
        message: e.toString(),
      );
      log("message");
    }
  }

  //RESET PASSWORD EMAIl
  //
  //
  Future<void> resendPasswordResetEmail() async {
    try {
      //START LOADING
      log("Ecommerce-start loding");
      UFullScreenLoader.openLoadingDialog("logging you in..");
      //CHEACK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        log("Ecommerce-INTERNET CONNECTIVITY");
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }
      //Send Password Reset mail
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text);

      //Stop loading
      UFullScreenLoader.stopLoading();

      //Success Message
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Send to Reset Your Password',
      );
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Failed Forget Password',
        message: e.toString(),
      );
      log("message");
    }
  }
}
