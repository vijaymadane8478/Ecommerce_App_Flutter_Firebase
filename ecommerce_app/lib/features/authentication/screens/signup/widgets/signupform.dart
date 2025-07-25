import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/privacypolicycheackbox.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:ecommerce_app/utilits/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class signUPForm extends StatelessWidget {
  const signUPForm({super.key});

  @override
  Widget build(BuildContext context) {
    //controller
    final controller = SignUpController.instance;

    return Form(
      key: controller.signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///form.....................
          Column(
            children: [
              //FIRST AND LAST NAME
              Row(
                children: [
                  //FIRST NAME
                  Expanded(
                    child: TextFormField(
                      controller: controller.firstName,
                      validator:
                          (value) =>
                              UValidator.validateEmptyText("First Name", value),
                      decoration: InputDecoration(
                        labelText: UTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ),
                  SizedBox(width: USizes.spaceBtwInputFields),
                  //LAST NAME
                  Expanded(
                    child: TextFormField(
                      controller: controller.lastName,
                      validator:
                          (value) =>
                              UValidator.validateEmptyText("Last Name", value),
                      decoration: InputDecoration(
                        labelText: UTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwInputFields),
              //EMAIl
              TextFormField(
                controller: controller.email,
                validator: (value) => UValidator.validateEmail(value),
                decoration: InputDecoration(
                  labelText: UTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              SizedBox(height: USizes.spaceBtwInputFields),
              //PHONE Number
              TextFormField(
                controller: controller.phonenumber,
                validator: (value) => UValidator.validatePhoneNumber(value),
                decoration: InputDecoration(
                  labelText: UTexts.phoneNumber,
                  prefixIcon: Icon(Iconsax.call),
                ),
              ),
              SizedBox(height: USizes.spaceBtwInputFields),
              //Password
              Obx(
                () => TextFormField(
                  obscureText: controller.isPasswordVisible.value,
                  controller: controller.password,
                  validator: (value) => UValidator.validatePassword(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed:
                          () =>
                              controller.isPasswordVisible.value =
                                  !controller.isPasswordVisible.value,
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                      ),
                    ),
                    labelText: UTexts.password,
                  ),
                ),
              ),
              SizedBox(height: USizes.spaceBtwInputFields),
              //PRIVACY POLICY
              privacypolicyCheckbox(),
              SizedBox(height: USizes.spaceBtwItems),
              UElevatedButton(
                onPressed: controller.registerUser,
                child: Text(UTexts.createAccount),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
