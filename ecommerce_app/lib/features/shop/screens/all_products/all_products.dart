import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/prouct_cards/prouct_card_verticals.dart';
import 'package:ecommerce_app/common/widgets/products/sortable_products.dart';
import 'package:ecommerce_app/utilits/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Popular Products",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: UsortableProducts(),
        ),
      ),
    );
  }
}
