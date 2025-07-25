import 'package:ecommerce_app/data/repositories/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_models.dart';
import 'package:ecommerce_app/features/authentication/screens/login/loign.dart';
import 'package:ecommerce_app/features/personalization/screens/Edit_profile/widgets/reauthenticate_userform.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/helpers/network_manager.dart';
import 'package:ecommerce_app/utilits/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utilits/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  ///Variables
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;

  //ReAuthenticate Form variables

  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormkey = GlobalKey<FormState>();
  RxBool isPaswordVisible = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  //Functio to save user record

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      //convert full name to firstname & lastname
      final nameParts = UserModel.nameParts(userCredential.user!.displayName);
      final username = '${userCredential.user!.displayName}12344321';

      //Create user model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
        username: username,
        email: userCredential.user!.email ?? '',
        phoneNumber: userCredential.user!.email ?? '',
        profilePicture: userCredential.user!.photoURL ?? '',
      );
      await _userRepository.saveUserRecord(userModel);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: "Data not Saved",
        message: 'somethind went wrong while saving',
      );
    }
  }

  /// Fucntion to fetch user
  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user.value = user;
      //this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //popup to delte account confirmation
  void deletAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure want to delete accont permanently',
      confirm: ElevatedButton(
        onPressed: deleteUserAccount,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: USizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text("Cancel"),
      ),
    );
  }

  //POP up to delte account
  Future<void> deleteUserAccount() async {
    try {
      //START LOADING
      UFullScreenLoader.openLoadingDialog('Processing...');
      //REAUTHENTICATION USER
      final authRepository = AuthenticationRepository.instance;
      final provider =
          authRepository.currentUser!.providerData
              .map((e) => e.providerId)
              .first;
      //if google provider
      if (provider == 'google.com') {
        await authRepository.signInWithGoogle();
        await authRepository.deleteAccount();
        //stop loading
        UFullScreenLoader.stopLoading();
        //back to login screen
        Get.offAll(() => LoginScreen());
        //if email password
      } else if (provider == 'password') {
        UFullScreenLoader.stopLoading();
        Get.to(() => ReauthenticateUserform());
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  //reatuheticate user fucntion
  Future<void> reAuthenticateUser() async {
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
      if (!reAuthFormkey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      //REAUTHENTICATE USER WITH EMAIL and password
      await AuthenticationRepository.instance
          .reAuthenticateUSerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();

      //Stop loading
      UFullScreenLoader.stopLoading();

      //Redirect
      Get.off(() => LoginScreen());
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: "Failed", message: e.toString());
    }
  }
}
