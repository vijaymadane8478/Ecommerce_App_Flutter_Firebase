import 'package:ecommerce_app/utilits/constants/colors.dart';
import 'package:ecommerce_app/utilits/helpers/device_helpers.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UTabBar({super.key, required this.tabs});

  //cutomize

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFUnctions.inDarkMode(context);
    return Material(
      color: dark ? UColors.black : UColors.white,
      child: TabBar(
        isScrollable: true,
        labelColor: dark ? UColors.white : UColors.primary,
        unselectedLabelColor: UColors.darkGrey,
        indicatorColor: UColors.primary,
        tabs: tabs,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(UDeviceHelper.getAppBarHeight());
}
