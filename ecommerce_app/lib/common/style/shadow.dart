import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class UShadow {
  UShadow._();

  static List<BoxShadow> searchBarShadow = [
    BoxShadow(
      color: UColors.black.withValues(alpha: 0.1),
      spreadRadius: 2.0,
      blurRadius: 4.0,
    ),
  ];

  static List<BoxShadow> verticalProductShadow = [
    BoxShadow(
      color: UColors.darkGrey.withValues(alpha: 0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2),
    ),
  ];
}
