import 'package:ecommerce_app/utilits/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class UElevatedButton extends StatelessWidget {
  const UElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UDeviceHelper.getScreenWidth(context),
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}
