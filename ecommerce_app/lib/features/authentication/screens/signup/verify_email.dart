import 'package:ecommerce_app/common/screens/success_screen.dart';
import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/features/authentication/screens/login/loign.dart';
import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:ecommerce_app/utilits/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifilemailScreen extends StatelessWidget {
  const VerifilemailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => LoginScreen()),
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              ///IMAGE
              Image.asset(
                UImages.mailSentImage,
                height: UDeviceHelper.getScreenWidth(context) * 0.6,
              ),

              ///TITLE
              Text(
                UTexts.verifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              ///EMAIL
              Text(
                "unknownpro@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              ///SUBTITLE
              Text(
                UTexts.verifyEmailSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              ///continue
              UElevatedButton(
                onPressed:
                    () => Get.to(
                      () => SuccessScreen(
                        title: UTexts.accountCreatedTitle,
                        subtitle: UTexts.accountCreatedSubTitle,
                        image: UImages.accountCreatedImage,
                        onTap: () {},
                      ),
                    ),
                child: Text(UTexts.uContinue),
              ),

              ///RESEND MAIL
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(UTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
