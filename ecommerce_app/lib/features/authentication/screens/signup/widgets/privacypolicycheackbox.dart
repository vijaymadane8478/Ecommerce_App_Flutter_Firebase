import 'package:ecommerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class privacypolicyCheckbox extends StatelessWidget {
  const privacypolicyCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    //controller here
    final controller = SignUpController.instance;
    final Dark = UHelperFUnctions.inDarkMode(context);
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged:
                (value) =>
                    controller.privacyPolicy.value =
                        !controller.privacyPolicy.value,
          ),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: [
              TextSpan(text: '${UTexts.iAgreeTo}'),
              TextSpan(
                text: ' ${UTexts.privacyPolicy}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Dark ? UColors.white : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: Dark ? UColors.white : UColors.primary,
                ),
              ),
              TextSpan(text: ' ${UTexts.and}'),
              TextSpan(
                text: ' ${UTexts.termsOfUse}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Dark ? UColors.white : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: Dark ? UColors.white : UColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
