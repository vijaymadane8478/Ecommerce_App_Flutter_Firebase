import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/constants/texts.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class privacypolicyCheckbox extends StatelessWidget {
  const privacypolicyCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final Dark = UHelperFUnctions.inDarkMode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
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
