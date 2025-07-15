import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/features/authentication/screens/forgot_password/forgot_password.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Uloginform extends StatelessWidget {
  const Uloginform({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Email
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: UTexts.email,
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        //password
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye),
            labelText: UTexts.password,
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields / 2),
        //REMEBER and FORGOT PASSWORD
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //remeber me
            Row(
              children: [
                Checkbox(value: true, onChanged: (Value) {}),
                Text(UTexts.rememberMe),
              ],
            ),
            //forgot password
            Row(
              children: [
                TextButton(
                  onPressed: () => Get.to(() => forgotPassWordScrren()),
                  child: Text(UTexts.forgetPassword),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections),
        //sign in
        UElevatedButton(
          onPressed: () => Get.to(() => NavigationMenu()),
          child: Text(UTexts.signIn),
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        //create accout
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => Get.to(() => SignupScreen()),
            child: Text(UTexts.createAccount),
          ),
        ),
      ],
    );
  }
}
