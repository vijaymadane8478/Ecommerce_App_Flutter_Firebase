import 'dart:developer';

import 'package:ecommerce_app/data/repositories/authentication_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utilits/constants/keys.dart';
import 'package:ecommerce_app/utilits/helpers/network_manager.dart';
import 'package:ecommerce_app/utilits/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utilits/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  //Variables
  final _userController = Get.put(UserController());
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadRememberedCredentials();
  }

  // Load saved email and password if Remember Me was checked
  Future<void> _loadRememberedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    email.text = prefs.getString(UKeys.rememberMeEmail) ?? "";
    password.text = prefs.getString(UKeys.rememberMePassword) ?? "";
  }

  /// Save credentials if Remember Me is checked
  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(UKeys.rememberMeEmail, email.text.trim());
    await prefs.setString(UKeys.rememberMePassword, password.text.trim());
  }

  /// Login With Email & Password
  Future<void> loginWithEmailAndPassword() async {
    try {
      log("MYAPP---Starting login process...");
      UFullScreenLoader.openLoadingDialog("Logging you in...");

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        log("MYAPP---Form validation failed.");
        return;
      }

      if (rememberMe.value) {
        log("MYAPP---Saving credentials");
        await _saveCredentials();
      }

      log("MYAPP---Logging in...");
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      UFullScreenLoader.stopLoading();
      log("MYAPP---Login successful, redirecting...");

      await AuthenticationRepository.instance.screenredirect();
    } catch (e) {
      UFullScreenLoader.stopLoading();
      log("MYAPP---Login failed: ${e.toString()}");

      USnackBarHelpers.errorSnackBar(
        title: "Login Failed",
        message: e.toString(),
      );
    }
  }

  /// Google Sign-In Placeholder
  Future<void> googleSignIn() async {
    try {
      log("MYAPP---Google Sign .");
      //START LOADING
      UFullScreenLoader.openLoadingDialog("logging you in..");
      //CHEACK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }
      //GOOGLE AUTHENTICATION
      UserCredential userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      //SAVE USER RECORD
      await _userController.saveUserRecord(userCredential);
      //STOP LOADING
      UFullScreenLoader.stopLoading();
      //REDIRECT
      AuthenticationRepository.instance.screenredirect();
    } catch (e) {
      //log("MYAPP---Google Sign In error: $e");
      //STOP LOADING
      UFullScreenLoader.stopLoading();
      //ERROR SNACK BAR
      // log("MYAPP---Login failed: ${e.toString()}");
      USnackBarHelpers.errorSnackBar(
        title: "Login Failed",
        message: e.toString(),
      );
    }
  }
}
