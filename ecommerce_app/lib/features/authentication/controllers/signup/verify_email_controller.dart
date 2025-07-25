import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_app/common/screens/success_screen.dart';
import 'package:ecommerce_app/data/repositories/authentication_repository.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:ecommerce_app/utilits/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///SEND EMAIL VERFICATIOn link to current user
  Future<void> sendEmailVerification() async {
    log("APP--send email");
    try {
      await AuthenticationRepository.instance.sendEmailVerification();

      USnackBarHelpers.successSnackBar(
        title: "Email Send",
        message: "Plese check your inbox and verify your Email...",
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  //TIMER TO AUTOMATICALLY Redirect email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            title: UTexts.accountCreatedTitle,
            subtitle: UTexts.accountCreatedSubTitle,
            image: UImages.accountCreatedImage,
            onTap: () => AuthenticationRepository.instance.screenredirect(),
          ),
        );
      }
    });
  }

  //Manually check email verification status
  Future<void> checkEmailVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(
          () => SuccessScreen(
            title: UTexts.accountCreatedTitle,
            subtitle: UTexts.accountCreatedSubTitle,
            image: UImages.accountCreatedImage,
            onTap: () => AuthenticationRepository.instance.screenredirect(),
          ),
        );
      }
    } catch (e) {}
  }
}
