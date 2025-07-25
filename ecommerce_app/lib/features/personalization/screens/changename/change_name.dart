import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/features/personalization/controllers/change_name_controller.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:ecommerce_app/utilits/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //change name contoller put
    final Controller = Get.put(ChangeNameController());
    return Scaffold(
      //AppBar
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Update Screen",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: UPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TEXT HEEADING
            Text(
              'Update your name to kepp your profile accurate and personalize',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: USizes.spaceBtwSections),
            //FORM
            Form(
              key: Controller.updateUserFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: Controller.firstName,
                    validator:
                        (value) =>
                            UValidator.validateEmptyText('First Name', value),
                    decoration: InputDecoration(
                      labelText: UTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields),
                  TextFormField(
                    controller: Controller.lastname,
                    validator:
                        (value) =>
                            UValidator.validateEmptyText('Last Name', value),
                    decoration: InputDecoration(
                      labelText: UTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: USizes.spaceBtwSections),
            //Save Button
            UElevatedButton(
              onPressed: Controller.updateUserName,
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
    //body
  }
}
