import 'package:ecommerce_app/common/screens/success_screen.dart';
import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/elevated_button.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/textfields/promo_code.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/biilingamountsection.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/navigation_menu.dart';

import 'package:ecommerce_app/utilits/constants/images.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //....[Appar].......
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      //....[BODy].......
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              //lIST OF ITEM
              UCartItems(showAddRemoveButtons: false),
              SizedBox(height: USizes.spaceBtwSections),

              //PROMO CODE _ TEXTFILEd
              UPromoCodeField(),

              SizedBox(height: USizes.spaceBtwSections),

              //Billing Section
              URoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(USizes.md),
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    //Amount
                    UBillingAmoutSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    //Payment
                    UBilllingPaymentSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    //Addresse
                    UBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed:
              () => Get.to(
                () => SuccessScreen(
                  title: 'Payment Succes!',
                  subtitle: 'Your item will be shifted soon',
                  image: UImages.successfulPaymentIcon,
                  onTap: () => Get.offAll((() => NavigationMenu())),
                ),
              ),
          child: Text('Checkout \$263527'),
        ),
      ),
    );
  }
}
