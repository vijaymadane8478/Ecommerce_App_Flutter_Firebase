import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:ecommerce_app/utilits/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReauthenticateUserform extends StatelessWidget {
  const ReauthenticateUserform({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Re-Authenticate User')),

      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Form(
            key: controller.reAuthFormkey,
            child: Column(
              children: [
                //EMAIL
                TextFormField(
                  controller: controller.email,
                  validator: UValidator.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UTexts.email,
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                //PASSWORD
                Obx(
                  () => TextFormField(
                    obscureText: controller.isPaswordVisible.value,
                    controller: controller.password,
                    validator:
                        (value) =>
                            UValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: UTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.isPaswordVisible.toggle(),
                        icon: Icon(
                          controller.isPaswordVisible.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwSections),
                //Verify BUTTON
                UElevatedButton(
                  onPressed: controller.reAuthenticateUser,
                  child: Text("Verify"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
