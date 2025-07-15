import 'package:ecommerce_app/common/widgets/custom_shapes/clipper/custom_roundedclipper.dart';
import 'package:flutter/material.dart';

class URoundedEdges extends StatelessWidget {
  const URoundedEdges({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: UcustomRoundedEdges(), child: child);
  }
}
