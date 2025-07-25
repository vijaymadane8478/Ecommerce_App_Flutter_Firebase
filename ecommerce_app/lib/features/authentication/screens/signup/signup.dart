import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/social_buttons.dart';
import 'package:ecommerce_app/common/widgets/login_sigup/form_divider.dart';
import 'package:ecommerce_app/features/authentication/controllers/signup/signup_controller.dart'
    show SignUpController;
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/signupform.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              ///header...................
              Text(
                UTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),
              //signup form
              signUPForm(),
              SizedBox(height: USizes.spaceBtwSections),

              ///Divider
              UformDivider(title: UTexts.orSignupWith),
              SizedBox(height: USizes.spaceBtwSections),

              ///Footer buttons
              UsocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
