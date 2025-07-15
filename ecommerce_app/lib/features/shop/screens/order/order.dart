import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/features/shop/screens/order/widgets/order_list.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(padding: UPadding.screenPadding, child: UOrderListItems()),
    );
  }
}
