import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddnewAddressScreen extends StatelessWidget {
  const AddnewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR.........********
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      ////....[BODY]....
      body: SingleChildScrollView(
        padding: UPadding.screenPadding,
        child: Column(
          children: [
            //Name
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                labelText: "Name",
              ),
            ),
            SizedBox(height: USizes.spaceBtwInputFields),
            //Phone Number
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.mobile),
                labelText: "Phone Number",
              ),
            ),
            SizedBox(height: USizes.spaceBtwInputFields),
            //Street
            //Postal code
            Row(
              children: [
                //street
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.building_31),
                      labelText: "Street",
                    ),
                  ),
                ),
                SizedBox(width: USizes.spaceBtwInputFields),
                //postal code
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.code),
                      labelText: "Postal Code",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: USizes.spaceBtwInputFields),

            //City
            //State
            Row(
              children: [
                //city
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.building),
                      labelText: "City",
                    ),
                  ),
                ),
                SizedBox(width: USizes.spaceBtwInputFields),
                //state
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.activity),
                      labelText: "State",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: USizes.spaceBtwInputFields),
            //Country
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.global),
                labelText: "Country",
              ),
            ),
            SizedBox(height: USizes.spaceBtwSections),
            //Save Button
            UElevatedButton(onPressed: () {}, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
