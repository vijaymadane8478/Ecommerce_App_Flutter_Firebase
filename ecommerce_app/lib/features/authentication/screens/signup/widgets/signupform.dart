import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/privacypolicycheackbox.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class signUPForm extends StatelessWidget {
  const signUPForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              decoration: InputDecoration(
                labelText: UTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            SizedBox(height: USizes.spaceBtwInputFields),
            //PHONE Number
            TextFormField(
              decoration: InputDecoration(
                labelText: UTexts.phoneNumber,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            SizedBox(height: USizes.spaceBtwInputFields),
            //Password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye),
                labelText: UTexts.password,
              ),
            ),
            SizedBox(height: USizes.spaceBtwInputFields),
            //PRIVACY POLICY
            privacypolicyCheckbox(),
            SizedBox(height: USizes.spaceBtwItems),
            UElevatedButton(
              onPressed: () => Get.to(() => VerifilemailScreen()),
              child: Text(UTexts.createAccount),
            ),
          ],
        ),
      ],
    );
  }
}
