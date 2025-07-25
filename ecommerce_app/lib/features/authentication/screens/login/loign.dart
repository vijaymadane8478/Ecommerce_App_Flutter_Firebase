import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/social_buttons.dart';
import 'package:ecommerce_app/common/widgets/login_sigup/form_divider.dart';
import 'package:ecommerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //initilize controller
    Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //.....[Header].....
              Uloginheader(),
              SizedBox(height: USizes.spaceBtwItems),
              //.....[Form].....
              Uloginform(),
              SizedBox(height: USizes.spaceBtwItems),
              //.....[Divider].....
              UformDivider(title: UTexts.orSignInWith),
              SizedBox(height: USizes.spaceBtwSections),
              //.....[Footer].....//section button
              UsocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
